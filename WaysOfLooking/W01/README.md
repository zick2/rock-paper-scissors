
- W01-Csharp
- ## ChatGPT Prompt 

**NOTE: This is the ChatGPT Pompt that produced the static "Fish" recorded in Program.cs**

The Elves begin to set up camp on the beach. To decide whose tent gets to be closest to the snack storage, a giant Rock Paper Scissors tournament is already in progress.

Rock Paper Scissors is a game between two players. Each game contains many rounds; in each round, the players each simultaneously choose one of Rock, Paper, or Scissors using a hand shape. Then, a winner for that round is selected: Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock. If both players choose the same shape, the round instead ends in a draw.

Appreciative of your help yesterday, one Elf gives you an encrypted strategy guide (your puzzle input) that they say will be sure to help you win. "The first column is what your opponent is going to play: A for Rock, B for Paper, and C for Scissors. The second column--" Suddenly, the Elf is called away to help with someone's tent.

The second column, you reason, must be what you should play in response: X for Rock, Y for Paper, and Z for Scissors. Winning every time would be suspicious, so the responses must have been carefully chosen.

The winner of the whole tournament is the player with the highest score. Your total score is the sum of your scores for each round. The score for a single round is the score for the shape you selected (1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).

Since you can't be sure if the Elf is trying to help you or trick you, you should calculate the score you would get if you were to follow the strategy guide.

For example, suppose you were given the following strategy guide:
```
A Y
B X
C Z
```
This strategy guide predicts and recommends the following:

In the first round, your opponent will choose Rock (A), and you should choose Paper (Y). This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
In the second round, your opponent will choose Paper (B), and you should choose Rock (X). This ends in a loss for you with a score of 1 (1 + 0).
The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
In this example, if you were to follow the strategy guide, you would get a total score of 15 (8 + 1 + 6).
+D25
What would your total score be if everything goes exactly according to your strategy guide?


### Code Request:

Please write a c# program to figure out the answer to this question.

Please make sure that the calculation of the score is very verbose and clear in what it is doing, and how it relates to the input instructions.

Please make sure that the code uses at least these functions:

CalculateGameScore
CalculateRoundScore
IsWin
IsLoss
- Given the rps.json - write an algorithm that does not mention any specific shapes, codes or scores.
- # ChatGPT Prompt

**Plase Note:** This is the ChatGPT Prompt that produceded the **Xslt Script CreateHelper.xslt** that produces the **RPSHelper.cs** file on build.

After ChatGPT had written the source code used in W01-ConsoleApp - I asked ChatGPT to describe its understanding of the rules in Json format.  This is what it provided.

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
```

I then asked ChatGPT to write an Xslt Script that could convert this data into a Helper Library with the mechanics of the rules, based on these very specific JsonRules.  The CreateHelper.xslt script that it created keeps this code in sync with the SSoT moving forward.

**RPSHelper.cs**
```
public static class RPSHelper {
    public static int CalculateRoundScore(char opponentChoice, char playerChoice)
    {
        int playerScore = 0;
        int outcomeScore = 0;
        switch (playerChoice)
        {
            case 'X':
                playerScore = 1;
                break;
            case 'Y':
                playerScore = 2;
                break;
            case 'Z':
                playerScore = 3;
                break;
        }

        if (IsWin(opponentChoice, playerChoice))
        {
            outcomeScore = 6;
        }
        else if (IsLoss(opponentChoice, playerChoice))
        {
            outcomeScore = 0;
        }
        else
        {
            outcomeScore = 3;
        }
        return playerScore + outcomeScore;
    }

    static bool IsWin(char opponentChoice, char playerChoice)
    {
        switch (opponentChoice)
        {
            case 'A':
                return playerChoice == 'Y';
            case 'B':
                return playerChoice == 'Z';
            case 'C':
                return playerChoice == 'X';
            default:
                return false;
        }
    }

    static bool IsLoss(char opponentChoice, char playerChoice)
    {
        switch (opponentChoice)
        {
            case 'A':
                return playerChoice == 'X';
            case 'B':
                return playerChoice == 'Y';
            case 'C':
                return playerChoice == 'Z';
            default:
                return false;
        }
    }
}```
                            
SUMMARY:                            
