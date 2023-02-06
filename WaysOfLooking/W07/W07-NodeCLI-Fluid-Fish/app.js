const fs = require('fs');

class RockPaperScissors {
    constructor() {
        this.gameJson = JSON.parse(fs.readFileSync('C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/SSoT/rps.json', 'utf8'))['rock-paper-scissors'];
    }

    calculateGameScore(strategyGuide) {
        let totalScore = 0;
        for (let i = 0; i < strategyGuide.length; i += 4) {
            const opponentChoice = strategyGuide[i];
            const playerChoice = strategyGuide[i + 2];
            const roundScore = this.calculateRoundScore(opponentChoice, playerChoice);
            console.log(`Round Score: ${roundScore}`);
            totalScore += roundScore;
        }
        return totalScore;
    }

    calculateRoundScore(opponentChoice, playerChoice) {
        const outcomes = this.gameJson.rules.outcomes;
        const shapes = this.gameJson.rules.shapes;
        const opponentShape = shapes.find(s => s.opp_code === opponentChoice);
        const playerShape = shapes.find(s => s.player_code === playerChoice);

        if (playerShape.wins_against === opponentShape.opp_code) {
            return outcomes.win + playerShape.score;
        } else if (opponentShape.wins_against === playerShape.opp_code) {
            return outcomes.loss + playerShape.score;
        } else {
            return outcomes.draw + playerShape.score;
        }
    }

    getStrategyGuide() {
        const games = this.gameJson.rules.games;
        const rounds = games.rounds;
        let strategyGuide = '';
        for (const round of rounds) {
            strategyGuide += `${round.opp_code} ${round.player_code}\n`;
        }
        return strategyGuide;
    }
}

if (require.main === module) {
    const rps = new RockPaperScissors();
    const strategyGuide = rps.getStrategyGuide();
    const totalScore = rps.calculateGameScore(strategyGuide);
    console.log(`Total score: ${totalScore}`);
}
