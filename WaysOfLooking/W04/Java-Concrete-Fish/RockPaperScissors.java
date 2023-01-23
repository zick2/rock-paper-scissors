public class RockPaperScissors {
    static int CalculateRoundScore(char opponentChoice, char playerChoice) {
        int playerScore = 0;
        int outcomeScore = 0;
        switch (playerChoice) {
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
        if (IsWin(opponentChoice, playerChoice)) {
            outcomeScore = 6;
        } else if (IsLoss(opponentChoice, playerChoice)) {
            outcomeScore = 0;
        } else {
            outcomeScore = 3;
        }
        return playerScore + outcomeScore;
    }

    static boolean IsWin(char opponentChoice, char playerChoice) {
        switch (opponentChoice) {
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

    static boolean IsLoss(char opponentChoice, char playerChoice) {
        switch (opponentChoice) {
            case 'A':
                return playerChoice == 'Z';
            case 'B':
                return playerChoice == 'X';
            case 'C':
                return playerChoice == 'Y';
            default:
                return false;
        }
    }

    static int CalculateGameScore(String strategyGuide) {
        int totalScore = 0;
        for (int i = 0; i < strategyGuide.length(); i += 2) {
            char opponentChoice = strategyGuide.charAt(i);
            char playerChoice = strategyGuide.charAt(i + 1);
            int roundScore = CalculateRoundScore(opponentChoice, playerChoice);
            totalScore += roundScore;
            System.out.println("Round Score: " + roundScore);
        }
        return totalScore;
    }

    public static void main(String[] args) {
        String strategyGuide = "AYBXCZ";
        int totalScore = CalculateGameScore(strategyGuide);
        System.out.println("Total Score: " + totalScore);
    }
}
