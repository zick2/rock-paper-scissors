namespace TestProject
{
    public class W07JavaScriptTests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }


        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/W07/nodeconsoleproject1/app.js");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestDynamicFish()
        {            
        
            var result = this.Invoke(@"/W07/W07-NodeCLI-Fluid-Fish/app.js");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


    }
}
