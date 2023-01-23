namespace TestProject
{
    public class W01CsharpTests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }


        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/W01/ConsoleApp1/bin/Debug/net7.0/W01-CSharp-Concrete-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestDynamicFish()
        {            
        
            var result = this.Invoke(@"/W01/W01-Dynamic-Fish/bin/Debug/net7.0/W01-CSharp-Dynamic-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestFishingPole()
        {            
            var result = this.Invoke(@"/W01/W01-Dynamic-Fish/bin/Debug/net7.0/W01-CSharp-Dynamic-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }
    }
}
