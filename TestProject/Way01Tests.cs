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
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }

        [Test]
        public void TestDynamicFish()
        {            
            var result = this.Invoke(@"/WaysOfLooking/W02/W02-ConsoleAppWithSSoT/bin/Debug/net7.0/W01-CSharp-Dynamic-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }

        [Test]
        public void TestFishingPole()
        {            
            var result = this.Invoke(@"/WaysOfLooking/W01/ConsoleAppWithSSoT/bin/Debug/net7.0/W01-CSharp-Fishing-Pole.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }
    }
}