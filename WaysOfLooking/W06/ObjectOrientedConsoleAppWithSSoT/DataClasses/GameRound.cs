namespace TWOLAT.RPS.Lib
{                   
    
    public partial class GameRound 
    {        
        public GameRound(char player_code, char opp_code)
        {
            this.PlayerCode = $"{player_code}";
            this.OppCode = $"{opp_code}";
        }

        public void PlayRound(Game game)
        {
            Shape playerShape = game.CreateShape(PlayerCode[0]);
            Shape opponentShape = game.CreateShape(OppCode[0]);
            var choice_score = playerShape.Score;
            var outcome_score = 0;
            if (playerShape.WinsTo(opponentShape))
            {
                outcome_score = Outcome.WinScore;
            }
            else if (playerShape.LosesTo(opponentShape))
            {
                outcome_score = Outcome.LossScore;
            }
            else
            {
                outcome_score = Outcome.DrawScore;
            }

            var round_score = choice_score + outcome_score;
            Console.WriteLine($"Round Score: {round_score}");
            if (game.Score is null) game.Score = 0;
            game.Score += round_score;
        }

    }
}