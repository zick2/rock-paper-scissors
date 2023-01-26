namespace TestProject
{
    public class W02FsharpTests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }


        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/W02/FSharp-Concrete-Fish\bin\Debug\net7.0\W02-FSharp-Concrete-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestDynamicFish()
        {            
        
            var result = this.Invoke(@"/W02/W02-Fluid-Fish\bin\Debug\net7.0\W02-FSharp-Fluid-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestFishingPole()
        {            
            var result = this.Invoke(@"/W02/W02-FSharp-FishingPole/bin/Debug/net7.0/W02-FSharp-Fishing-Pole.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }
    }
}
