namespace TestProject
{
    public class AdditionalTests : SharedTests
    {

        public override void Setup()
        {
            base.Setup();
        }

        [Test]
        public void TestConcreteReadme()
        {
            var fileName = new FileInfo(Path.Combine(WaysOfLookingRootPath, @"../README-Concrete-Fish.md"));
            var concreteReadme = File.ReadAllText(fileName.FullName);
            StringAssert.Contains($"{this.FinalScore}", concreteReadme);
        }

        [Test]
        public void TestDynamicReadme()
        {
            var fileName = new FileInfo(Path.Combine(WaysOfLookingRootPath, @"../README-Fluid-Fish.md"));
            var dynamicReadme = File.ReadAllText(fileName.FullName);
            StringAssert.Contains($"{this.FinalScore}", dynamicReadme);
        }
    }
}