# ChatGPT Prompt

**Plase Note:** This is the ChatGPT Prompt that produceded the **Xslt Script CreateHelper.xslt** that produces the **RPSHelper.cs** file on build.

After ChatGPT had written the source code used in W01-ConsoleApp - I asked ChatGPT to describe its understanding of the rules in Json format.  This is what it provided.

```
{
  "rock-paper-scissors": {
    "name": "Rock Paper Scissors",
    "rules": {
      "shapes": [
        {
          "code": "A",
          "name": "Rock",
          "defeats": "C",
          "player_code": "X",
          "score": 1
        },
        {
          "code": "B",
          "name": "Paper",
          "defeats": "A",
          "player_code": "Y",
          "score": 2
        },
        {
          "code": "C",
          "name": "Scissors",
          "defeats": "B",
          "player_code": "Z",
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
            "opponent_code": "A",
            "result": "win",
            "score": 8,
            "choice_score": 2,
            "outcome_score": 6
          },
          {
            "player_code": "X",
            "opponent_code": "B",
            "result": "loss",
            "score": 1,
            "choice_score": 1,
            "outcome_score": 0
          },
          {
            "player_code": "Z",
            "opponent_code": "C",
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