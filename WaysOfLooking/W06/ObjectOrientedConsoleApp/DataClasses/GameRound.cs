namespace ObjectOrientedConsoleApp
{
    public class GameRound
    {
        public char player_code { get; set; }
        public char opp_code { get; set; }
        public string result { get; set; }
        public int round_score { get; set; }
        public int choice_score { get; set; }
        public int outcome_score { get; set; }

        public GameRound(char player_code, char opp_code)
        {
            this.player_code = player_code;
            this.opp_code = opp_code;
        }


        public void PlayRound(Game game)
        {
            AbstractShape playerShape = game.CreateShape(player_code);
            AbstractShape opponentShape = game.CreateShape(opp_code);

            if (playerShape.WinsTo(opponentShape))
            {
                result = "win";
                outcome_score = game.WinScore;
            }
            else if (playerShape.LosesTo(opponentShape))
            {
                result = "loss";
                outcome_score = game.LossScore;
            }
            else
            {
                result = "draw";
                outcome_score = game.DrawScore;
            }

            choice_score = playerShape.Score;
            round_score = choice_score + outcome_score;
            Console.WriteLine($"Round Score: {round_score}");
            game.Score += round_score;
        }


    }
}
