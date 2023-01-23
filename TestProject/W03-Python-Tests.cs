namespace TestProject
{
    public class W03PythonTests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }


        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/W03/PythonApplication1\PythonApplication1.py");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestDynamicFish()
        {            
        
            var result = this.Invoke(@"/W03/W03-Python-Dynamic-Fish\W03_Pyton_Dynamic_Fish.py");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestFishingPole()
        {            
            var result = this.Invoke(@"/W03/PythonApplicationWithSSoT\Main.py");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }
    }
}
