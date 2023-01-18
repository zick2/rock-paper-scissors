namespace ObjectOrientedConsoleApp
{
    public class Paper : Shape
    {
        public override int Score => 2;
        public override char OppCode => 'B';
        public override char PlayerCode => 'Y';
        public override char WinsAgainst => 'A';

        public Paper() : base("Paper") { }
    }
}
