namespace TestProject
{
    public class Way01Tests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }

        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/WaysOfLooking/W01/ConsoleApp1/bin/Debug/net7.0/W01-CSharp-Concrete-Fish.exe");
            StringAssert.Contains("15", result);
        }
    }
}