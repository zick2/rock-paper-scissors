Can you finish implementing this csharp OOP solution to this game:

ChatGPT wrote the classes and infrastructure that makes this OOP version of the game work.  I gave us 6 Concrete Fish this time.

```
{
  "rock-paper-scissors": {
    "name": "Rock Paper Scissors",
    "rules": {
      "shapes": [
        {
          "name": "Rock",
          "opp_code": "A",
          "player_code": "X",
          "wins_against": "C",
          "score": 1
        },
        {
          "name": "Paper",
          "opp_code": "B",
          "player_code": "Y",
          "wins_against": "A",
          "score": 2
        },
        {
          "name": "Scissors",
          "opp_code": "C",
          "player_code": "Z",
          "wins_against": "B",
          "score": 3
        }
      ],
      "outcomes": {
        "win": 6,
        "loss": 0,
        "draw": 3
      },
      "games": {
        "name": "Example Game",
        "score": 15,
        "rounds": [
          {
            "player_code": "Y",
            "opp_code": "A",
            "result": "win",
            "score": 8,
            "choice_score": 2,
            "outcome_score": 6
          },
          {
            "player_code": "X",
            "opp_code": "B",
            "result": "loss",
            "score": 1,
            "choice_score": 1,
            "outcome_score": 0
          },
          {
            "player_code": "Z",
            "opp_code": "C",
            "result": "draw",
            "score": 6,
            "choice_score": 3,
            "outcome_score": 3
          }
        ]
      }
    }
  }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObjectOrientedConsoleApp
{
    public abstract class Shape
    {
        public Shape(string name)
        {
            Name = name ?? throw new ArgumentNullException(nameof(name));
        }

        public string Name { get; private set; }
        public abstract int Score { get; }
        public abstract Char OppCode { get; }
        public abstract Char PlayerCode { get; }

        internal bool WinsAgainst(Shape opponentShape)
        {
            throw new NotImplementedException();
        }

        internal bool LosesTo(Shape opponentShape)
        {
            throw new NotImplementedException();
        }
    }

    public class Rock : Shape
    {
        public override int Score => 1;
        public override char OppCode => 'A';
        ...
    }

    public class Paper...

    public class Game
    {
        public int WinScore { get => 6; }
        public int LossScore { get => 0; }
        public int DrawScore { get => 3; }

        public int Score { get; set; }

        public int Play(Shape opponentShape, Shape playerShape)
        {
            this.Score += playerShape.Score;

            if (playerShape.WinsAgainst(opponentShape))
            {
                Score += this.WinScore;
            }
            else if (playerShape.LosesTo(opponentShape))
            {
                Score += this.LossScore;
            }
            else Score += this.DrawScore;
        }
    }
}```

