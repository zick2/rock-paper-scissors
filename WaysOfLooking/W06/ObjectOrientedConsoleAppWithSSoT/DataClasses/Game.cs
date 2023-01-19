using System.ComponentModel;
                        
namespace TWOLAT.RPS.Lib
{                   
    
    public partial class Game 
    {
        public Game(string name)
        {
            this.Name = name;
            this.Games_GameRounds = new BindingList<GameRound>();
        }

        public void PlayGame()
        {
            foreach (GameRound round in this.Games_GameRounds)
            {
                round.PlayRound(this);
            }
        }      
    }
}