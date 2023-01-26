namespace TestProject
{
    public class W05VisualBasicTests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }


        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/W05/VisualBasicConsoleApp1\bin\Debug\net7.0\W05-VisualBasic-Concrete-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestDynamicFish()
        {            
        
            var result = this.Invoke(@"/W05/W05-VisualBasic-Fluid-Fish\bin\Debug\net7.0\W05-VisualBasic-Fluid-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestFishingPole()
        {            
            var result = this.Invoke(@"/W05/VisualBasicConsoleAppWithSSoT\bin\Debug\net7.0\W05-VisualBasic-Fishing-Pole.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }
    }
}
