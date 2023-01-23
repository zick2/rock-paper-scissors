using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics;
using System.Text;

namespace TestProject
{
    public partial class SharedTests
    {
        public static string RPSJsonFileName { get => "C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/SSoT/rps.json"; }
        public static string WaysOfLookingRootPath { get => "C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/WaysOfLooking/"; }
        private static dynamic jsonObject;

        static SharedTests()
        {
            string jsonString = File.ReadAllText(RPSJsonFileName);
            jsonObject = JsonConvert.DeserializeObject(jsonString);
        }

        public string ExpectedOutput
        {
            get
            {
                StringBuilder expectedOutput = new StringBuilder();
                dynamic rounds = jsonObject["rock-paper-scissors"]["rules"]["games"]["rounds"];
                foreach (dynamic round in rounds)
                {
                    expectedOutput.AppendLine($"Round Score: {round.score}");
                }
                expectedOutput.AppendLine($"Total Score: {jsonObject["rock-paper-scissors"]["rules"]["games"]["score"]}");
                return expectedOutput.ToString().ToLower().Trim();
            }
        }

        public int FinalScore
        {
            get { return jsonObject["rock-paper-scissors"]["rules"]["games"]["score"]; }
        }

        [SetUp]
        public virtual void Setup()
        {
            // Do nothing here
        }


        internal string Invoke(string relativePathToExecutable, string args = "", int timeout = 30, bool _2ndJavaCall = false)
        {
            var fullPathToExecutable = Path.Combine(WaysOfLookingRootPath, relativePathToExecutable.Trim("\\/".ToCharArray()));
            if (fullPathToExecutable.EndsWith(".py"))
            {
                args = fullPathToExecutable;
                fullPathToExecutable = "python";
            }
            if (fullPathToExecutable.EndsWith(".go"))
            {
                args = $"run {fullPathToExecutable}";
                fullPathToExecutable = "go";
            }
            bool isJava = fullPathToExecutable.EndsWith(".java");
            if (isJava)
            {
                Environment.CurrentDirectory = Path.GetDirectoryName(fullPathToExecutable);
                if (_2ndJavaCall)
                {
                    args = Path.GetFileNameWithoutExtension(fullPathToExecutable);
                }
                else
                {
                    args = Path.GetFileName(fullPathToExecutable);
                }
                var jarFiles = Directory.GetFiles(".", "*.jar");
                if (jarFiles.Any())
                {
                    args = " -cp \".;" + String.Join(",", jarFiles.Select(jarFile => Path.GetFileName(jarFile))) + "\" " + args;
                }
                fullPathToExecutable = _2ndJavaCall ? "java" : "javac";
            }
            var process = new Process
            {
                StartInfo = new ProcessStartInfo
                {
                    FileName = fullPathToExecutable,
                    Arguments = args,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true,
                    UseShellExecute = false,
                    CreateNoWindow = true,
                }
            };

            var outputBuilder = new StringBuilder();
            var errorBuilder = new StringBuilder();

            using (var outputWaitHandle = new AutoResetEvent(false))
            using (var errorWaitHandle = new AutoResetEvent(false))
            {
                process.OutputDataReceived += (sender, e) =>
                {
                    if (e.Data == null)
                    {
                        outputWaitHandle.Set();
                    }
                    else
                    {
                        outputBuilder.AppendLine(e.Data);
                    }
                };
                process.ErrorDataReceived += (sender, e) =>
                {
                    if (e.Data == null)
                    {
                        errorWaitHandle.Set();
                    }
                    else
                    {
                        errorBuilder.AppendLine(e.Data);
                    }
                };

                process.Start();

                process.BeginOutputReadLine();
                process.BeginErrorReadLine();

                if (process.WaitForExit(timeout * 1000) &&
                    outputWaitHandle.WaitOne(timeout * 1000) &&
                    errorWaitHandle.WaitOne(timeout * 1000))
                {
                    if (process.ExitCode != 0)
                    {
                        throw new Exception(errorBuilder.ToString());
                    }

                    Console.WriteLine($@"RAN: {relativePathToExecutable}
****************************
Expect Output:
{this.ExpectedOutput}

****************************
Output Received:
{outputBuilder.ToString().ToLower()}");

                    if (isJava && !_2ndJavaCall)
                    {
                        var _2ndOutput = this.Invoke(relativePathToExecutable, args, timeout, true);
                        outputBuilder.Append(_2ndOutput);
                    }

                    return outputBuilder.ToString().ToLower().Trim();
                }
                else
                {
                    throw new TimeoutException("Process execution timed out");
                }
            }
        }
    }
}