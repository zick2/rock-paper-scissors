'use strict';

const playerRockCode = "X";
const oppRockCode = "A";

const playerPaperCode = "Y";
const oppPaperCode = "B";

const playerScissorsCode = "Z";
const oppScissorsCode = "C";

function calculateRoundScore(opponentChoice, playerChoice) {
    if (playerWins(opponentChoice, playerChoice)) {
        return 6;
    } else if (playerLosses(opponentChoice, playerChoice)) {
        return 0;
    } else {
        return 3;
    }
}

function calculateChoiceScore(playerCode) {
    if (playerCode === playerRockCode) {
        return 1;
    }
    if (playerCode === playerPaperCode) {
        return 2;
    }
    if (playerCode === playerScissorsCode) {
        return 3;
    }
}

function playerWins(oppCode, playerCode) {
    return (
        (oppCode === oppScissorsCode && playerCode === playerRockCode) ||
        (oppCode === oppRockCode && playerCode === playerPaperCode) ||
        (oppCode === oppPaperCode && playerCode === playerScissorsCode)
    );
}

function playerLosses(oppCode, playerCode) {
    return (
        (oppCode === oppRockCode && playerCode === playerScissorsCode) ||
        (oppCode === oppPaperCode && playerCode === playerRockCode) ||
        (oppCode === oppScissorsCode && playerCode === playerPaperCode)
    );
}

function calculateGameScore(strategyGuide) {
    let totalScore = 0;
    for (const line of strategyGuide) {
        const opponentChoice = line[0];
        const playerChoice = line[2];
        const outcomeScore = calculateRoundScore(opponentChoice, playerChoice);

        const choiceScore = calculateChoiceScore(playerChoice);
        const roundScore = choiceScore + outcomeScore;
        console.log(`Round Score: ${roundScore}`);
        totalScore += roundScore;
    }
    return totalScore;
}

const strategyGuide = ['A Y', 'B X', 'C Z'];
const totalScore = calculateGameScore(strategyGuide);

console.log(`Total Score: ${ totalScore }`);