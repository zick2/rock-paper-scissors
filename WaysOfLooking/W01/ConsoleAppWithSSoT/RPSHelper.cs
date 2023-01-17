
public static class RPSHelper {
    public static string TestGameStrategyGuide { get { return @"A Y
B X
C Z
"; } }
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
}