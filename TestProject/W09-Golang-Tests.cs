namespace TestProject
{
    public class W09GolangTests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }


        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/W09/Concrete-Fish\RockPaperScissors.go");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestDynamicFish()
        {            
        
            var result = this.Invoke(@"/W09/Dynamic-Fish\RockPaperScissors.go");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestFishingPole()
        {            
            var result = this.Invoke(@"/W09/Fishing-Pole\RockPaperScissors.go");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }
    }
}
