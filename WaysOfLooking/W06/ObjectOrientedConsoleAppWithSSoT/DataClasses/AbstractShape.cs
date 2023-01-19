namespace TWOLAT.RPS.Lib
{
    public class AbstractShape : Shape
    {
        public AbstractShape(String name, char playerCode, char oppCode, char winsAgainst, int score)
                : base(name, playerCode, oppCode, winsAgainst, score)
        {}
    }
}
