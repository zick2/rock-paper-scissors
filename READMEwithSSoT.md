# Rock Paper Scissors
The Elves begin to set up camp on the beach. To decide whose tent gets to be closest to the snack storage, a giant Rock Paper Scissors tournament is already in progress.

Rock Paper Scissors is a game between two players. Each game contains many rounds; in each round, the players each simultaneously choose one of Rock,Paper,Scissors using a hand shape. Then, a winner for that round is selected :Rock wins against Scissors,Paper wins against Rock,Scissors wins against Paper.  If both players choose the same shape, the round instead ends in a draw. 
## Shapes and Outcomes

There are 3 shapes. They are:
 - Rock (opp code: `A`, player code: `X`, wins against: `Scissors`, score: 1), 
 - Paper (opp code: `B`, player code: `Y`, wins against: `Rock`, score: 2), 
 - Scissors (opp code: `C`, player code: `Z`, wins against: `Paper`, score: 3), 


The outcome scores are: 
 - Win: 6
 - Loss: 0
 - Draw: 3

## The Rules

Appreciative of your help yesterday, one Elf gives you an encrypted strategy guide (your puzzle input) that they say will be sure to help you win. "The first column is what your opponent is going to play: A for Rock, B for Paper, C for Scissors and the second column is what you should play in response: X for Rock, Y for Paper, Z for Scissors, Winning every time would be suspicious, so the responses must have been carefully chosen.
    
The winner of the whole tournament is the player with the highest score. Your total score is the sum of your scores for each round. The score for a single round is the score for the shape you selected (Rock = 1,Paper = 2,Scissors = 3) plus the score for the outcome of the round (win = 6,loss = 0,draw = 3).
            
Since you can't be sure if the Elf is trying to help you or trick you, you should calculate the score you would get if you were to follow the strategy guide.


### Example Game

Since you can't be sure if the Elf is trying to help you or trick you, you should calculate the score you would get if you were to follow the strategy guide.

For example, suppose you were given the following strategy guide:

```
A Y
B X
C Z
```
This strategy guide predicts and recommends the following:

- Opponent chose Rock (code A), player chose Paper (code Y)
the round was a win, with a score of 8
      choice score: 2, outcome score: 6
- Opponent chose Paper (code B), player chose Rock (code X)
the round was a loss, with a score of 1
      choice score: 1, outcome score: 0
- Opponent chose Scissors (code C), player chose Scissors (code Z)
the round was a draw, with a score of 6
      choice score: 3, outcome score: 3
The final score is: 15
