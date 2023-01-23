using System.ComponentModel.DataAnnotations;
using System.Diagnostics;
using System.Text;

namespace TestProject
{
    public class SharedTests
    {
        public string ExpectedOutput { get; private set; }
        public string RootPath { get; private set; }
        public string ExpectedOutput1
        {
            get
            {
                return @"Round Score: 8
Round Score: 1
Round Score: 6
Total Score: 15";
            }
        }

        public string ExpectedOutput2
        {
            get
            { 
                return @"Round Score: 80
Round Score: 10
Round Score: 60
Total Score: 150";
            }
        }

        public string ExpectedOutput3
        {
            get
            {
                return @"Round Score: 19
Round Score: 20
Round Score: 8
Total Score: 47";
            }
        }

        [SetUp]
        public virtual void Setup()
        {
            this.ExpectedOutput = this.ExpectedOutput1.ToLower();
            this.RootPath = "C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/";
        }

        internal string Invoke(string relativePathToExecutable, string args = "", int timeout = 30)
        {
            var fullPathToExecutable = Path.Combine(this.RootPath, relativePathToExecutable.Trim("//".ToCharArray()));
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