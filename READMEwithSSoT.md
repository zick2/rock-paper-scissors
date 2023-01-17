# Phaser, Shield, Klingon, Borg
The Elves begin to set up camp on the beach. To decide whose tent gets to be closest to the snack storage, a giant Phaser, Shield, Klingon, Borg tournament is already in progress.

Phaser, Shield, Klingon, Borg is a game between two players. Each game contains many rounds; in each round, the players each simultaneously choose one of Phaser,Shield,Klingon,Borg using a hand shape. Then, a winner for that round is selected :Phaser defeats Klingon,Shield defeats Borg,Klingon defeats Shield,Borg defeats Phaser.  If both players choose the same shape, the round instead ends in a draw. 
## Shapes and Outcomes

There are 4 shapes. They are:
Phaser (opp code: `P`, player code: `X`, score: 5), 
Shield (opp code: `S`, player code: `Y`, score: 10), 
Klingon (opp code: `K`, player code: `Z`, score: 8), 
Borg (opp code: `B`, player code: `W`, score: 7), 
The outcome scores are: Win: 12, Loss: 0, Draw: 6

## The Rules

Appreciative of your help yesterday, one Elf gives you an encrypted strategy guide (your puzzle input) that they say will be sure to help you win. "The first column is what your opponent is going to play: P for Phaser, S for Shield, K for Klingon, B for Borg and the second column is what you should play in response: X for Phaser, Y for Shield, Z for Klingon, W for Borg, Winning every time would be suspicious, so the responses must have been carefully chosen.
    
The winner of the whole tournament is the player with the highest score. Your total score is the sum of your scores for each round. The score for a single round is the score for the shape you selected (Phaser = 5,Shield = 10,Klingon = 8,Borg = 7) plus the score for the outcome of the round (win = 12,loss = 0,draw = 6).
            
Since you can't be sure if the Elf is trying to help you or trick you, you should calculate the score you would get if you were to follow the strategy guide.

###Example Game

Since you can't be sure if the Elf is trying to help you or trick you, you should calculate the score you would get if you were to follow the strategy guide.

For example, suppose you were given the following strategy guide:

```
B Y
K X
P W
```
This strategy guide predicts and recommends the following:

- Opponent chose Borg (code B), player chose  (code Y)
the round was a win, with a score of 22
      choice score: 10, outcome score: 12
- Opponent chose Klingon (code K), player chose  (code X)
the round was a win, with a score of 17
      choice score: 5, outcome score: 12
- Opponent chose Phaser (code P), player chose  (code W)
the round was a win, with a score of 19
      choice score: 7, outcome score: 12
The final score is: 58
