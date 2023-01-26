# Advent of Code - Rock, Paper Scissors

These rules describe a game inspired by the traditional Rock, Paper, Scissors with these shapes (Rock, Paper, and Scissors), that was described by the Day 2 Challenge of the annual event, Advent of Code 2022.

Each shape has a unique code for the player (X, Y, and Z) and opponent (A, B, and C) to use. Each shape also has a score (1, 2, and 3) and a shape that it wins against (C, A, and B). The game also has specific outcomes for win, loss, and draw with scores of (6, 0, and 3) respectively.

## Input Language Rules
In this version, the only rules for the input format are that it contain these 6 sets of data, surrounded by parentheses.

 - (shape, names, separated, by commas)
 - (player, codes, separated, by commas)
 - (opponent, codes)
 - (shape, scores)
 - (wins, againt, player, codes)
 - (outcome, scores)
