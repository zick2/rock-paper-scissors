namespace TestProject
{
    public class W04JavaTests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }


        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/W04/Java-Concrete-Fish/RockPaperScissors.java");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestDynamicFish()
        {            
        
            var result = this.Invoke(@"/W04/Java-Fluid-Fish\RockPaperScissors.java");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestFishingPole()
        {            
            var result = this.Invoke(@"/W04/Java-Fluid-Fish\RockPaperScissors.java");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }
    }
}
