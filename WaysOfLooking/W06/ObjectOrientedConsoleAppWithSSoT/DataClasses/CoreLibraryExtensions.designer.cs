
namespace TWOLAT.RPS.Lib
{
    public static partial class CoreLibraryExtensions 
    {
        public static Shape CreateShape(this Game game, char code)
        {
            switch (code)
            {
                case 'A':
                case 'X':
                    return new Rock();
                case 'B':
                case 'Y':
                    return new Paper();
                case 'C':
                case 'Z':
                    return new Scissors();
                default:
                    throw new ArgumentException("Invalid shape code");
            }
        }     
        
        public static void AddSampleGame(this Game game)
        {
            game.Games_GameRounds.Add(new GameRound('Y', 'A'));// win: Paper vs. Rock
            game.Games_GameRounds.Add(new GameRound('X', 'B'));// loss: Rock vs. Paper
            game.Games_GameRounds.Add(new GameRound('Z', 'C'));// draw: Scissors vs. Scissors
        }
    }

    public partial class Outcome
    {
        public static int WinScore { get => 6; }
        public static int LossScore { get => 0; }
        public static int DrawScore { get => 3; }
    }            
}