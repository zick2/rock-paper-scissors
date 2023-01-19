namespace ObjectOrientedConsoleApp
{
    public class Game
    {
        public int WinScore { get => 6; }
        public int LossScore { get => 0; }
        public int DrawScore { get => 3; }

        public int Score { get; set; }
        public string Name { get; set; }
        public List<GameRound> rounds { get; set; }

        public Game(string name)
        {
            Name = name;
            rounds = new List<GameRound>();
        }

        public void PlayGame()
        {
            foreach (GameRound round in rounds)
            {
                round.PlayRound(this);
            }
        }


        public AbstractShape CreateShape(char code)
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

    }
}
