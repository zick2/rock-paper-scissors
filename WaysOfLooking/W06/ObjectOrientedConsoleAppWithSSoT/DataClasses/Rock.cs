
namespace TWOLAT.RPS.Lib
{
    public class Rock : Shape
    {
        public override int Score => 1;
        public override char OppCode => 'A';
        public override char PlayerCode => 'X';
        public override char WinsAgainst => 'C';

        public Rock() : base("Rock") { }
    }
}

