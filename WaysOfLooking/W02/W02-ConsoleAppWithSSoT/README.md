# ChatGPT Prompt:

**NOTE:** This is the ChatGPT prompt/conversation that inspired this code.

Please describe the game defined by this json:
```
{
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
        "games": [
            {
                "name": "Example Game",
                "rounds": [
                    {
                        "opponent_code": "A",
                        "player_code": "Y"
                    },
                    {
                        "opponent_code": "B",
                        "player_code": "X"
                    },
                    {
                        "opponent_code": "C",
                        "player_code": "Z"
                    }
                ]
            }
        ]
    }
}

```

"Rock, Paper, Scissors" is a simple game that has been played for centuries. The game is played by two or more players who simultaneously choose one of three options: rock, paper, or scissors.

Here are the rules of the game as described in the provided JSON:

### Shapes:

- Rock (code "A"): Defeats Scissors (code "C"), player code "X", score 1.
- Paper (code "B"): Defeats Rock (code "A"), player code "Y", score 2.
- Scissors (code "C"): Defeats Paper (code "B"), player code "Z", score 3.

### Outcomes:

Win: 6.0 points.
Loss: 0.0 points.
Draw: 3.0 points.

### Games:

**Example Game:** Score 15.0


#### Rounds:
- Player code "Y" chooses Paper (code "B"), opponent code "A" chooses Rock (code "A"), result is "win", score 8, choice_score 2, outcome_score 6.
- Player code "X" chooses Rock (code "A"), opponent code "B" chooses Paper (code "B"), result is "loss", score 1, choice_score 1, outcome_score 0.
- Player code "Z" chooses Scissors (code "C"), opponent code "C" chooses Scissors (code "C"), result is "draw", score 6, choice_score 3, outcome_score 3.

To play the game, players simultaneously choose one of the three options (rock, paper, or scissors) and reveal their choice. The winner is determined by the following rules:

Rock beats scissors (rock crushes scissors)
Scissors beat paper (scissors cut paper)
Paper beats rock (paper covers rock)

In case of a draw, players make the same choice and the round is a draw.

## Changing all the rules

**NOTE: ** This prompt was based on the conversation up till this point.

Please create a version of the json - replacing Rock, Paper Scissors with Phaser, Shield, Klingon, Borg, 
changing all of the codes and scores.

```
{
  "rock-paper-scissors": {
    "name": "Phaser, Shield, Klingon, Borg",
    "rules": {
      "shapes": [
        {
          "code": "P",
          "name": "Phaser",
          "defeats": "K",
          "player_code": "X",
          "score": 5
        },
        {
          "code": "S",
          "name": "Shield",
          "defeats": "B",
          "player_code": "Y",
          "score": 10
        },
        {
          "code": "K",
          "name": "Klingon",
          "defeats": "S",
          "player_code": "Z",
          "score": 8
        },
        {
          "code": "B",
          "name": "Borg",
          "defeats": "P",
          "player_code": "W",
          "score": 7
        }
      ],
      "outcomes": {
        "win": 12,
        "loss": 0,
        "draw": 6
      },
      "games": {
        "name": "Example Game",
        "score": 58,
        "rounds": [
          {
            "player_code": "Y",
            "opponent_code": "B",
            "result": "win",
            "score": 22,
            "choice_score": 10,
            "outcome_score": 12
          },
          {
            "player_code": "X",
            "opponent_code": "K",
            "result": "win",
            "score": 17,
            "choice_score": 5,
            "outcome_score": 12
          },
          {
            "player_code": "W",
            "opponent_code": "P",
            "result": "win",
            "score": 19,
            "choice_score": 7,
            "outcome_score": 12
          }
        ]
      }
    }
  }
}
```

## Description of changed rules

In this version, players can choose between four options: Phaser, Shield, Klingon, and Borg.

- Phaser (code "P"): Defeats Klingon (code "K"), player code "X", score 5.
- Shield (code "S"): Defeats Borg (code "B"), player code "Y", score 10.
- Klingon (code "K"): Defeats Shield (code "S"), player code "Z", score 8.
- Borg (code "B"): Defeats Phaser (code "P"), player code "W", score 7.

To play the game, players simultaneously choose one of the four options and reveal their choice. The winner is determined by the following rules:

- Phaser beats Klingon
- Shield beat Borg
- Klingon beats Shield
- Borg beat Phaser

In case of a draw, players make the same choice and the round is a draw.