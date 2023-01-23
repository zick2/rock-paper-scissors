namespace TestProject
{
    public class W06CSharpOOPTests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }


        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/W06/ObjectOrientedConsoleApp/bin/Debug/net7.0/W06-OOP-CS-Concrete-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }




        [Test]
        public void TestFishingPole()
        {            
            var result = this.Invoke(@"/W06/ObjectOrientedConsoleAppWithSSoT/bin/Debug/net7.0/W06-OOP-CS-Flowing-SSoT.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }
    }
}
