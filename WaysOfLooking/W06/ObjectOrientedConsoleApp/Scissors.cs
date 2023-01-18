namespace ObjectOrientedConsoleApp
{
    public class Scissors : Shape
    {
        public override int Score => 3;
        public override char OppCode => 'C';
        public override char PlayerCode => 'Z';
        public override char WinsAgainst => 'B';

        public Scissors() : base("Scissors") { }
    }
}
