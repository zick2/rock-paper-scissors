
public static class RPSHelper {
    public static string TestGameStrategyGuide { get { return @"B Y
K X
P W
"; } }
    public static int CalculateRoundScore(char opponentChoice, char playerChoice)
    {
        int playerScore = 0;
        int outcomeScore = 0;
        switch (playerChoice)
        {
            case 'X':
                playerScore = 5;
                break;
            case 'Y':
                playerScore = 10;
                break;
            case 'Z':
                playerScore = 8;
                break;
            case 'W':
                playerScore = 7;
                break;
        }

        if (IsWin(opponentChoice, playerChoice))
        {
            outcomeScore = 12;
        }
        else if (IsLoss(opponentChoice, playerChoice))
        {
            outcomeScore = 0;
        }
        else
        {
            outcomeScore = 6;
        }
        return playerScore + outcomeScore;
    }

    static bool IsWin(char opponentChoice, char playerChoice)
    {
        switch (opponentChoice)
        {
            case 'P':
                return playerChoice == 'W';
            case 'S':
                return playerChoice == 'Z';
            case 'K':
                return playerChoice == 'X';
            case 'B':
                return playerChoice == 'Y';
            default:
                return false;
        }
    }

    static bool IsLoss(char opponentChoice, char playerChoice)
    {
        switch (opponentChoice)
        {
            case 'P':
                return playerChoice == 'X';
            case 'S':
                return playerChoice == 'Y';
            case 'K':
                return playerChoice == 'Z';
            case 'B':
                return playerChoice == 'W';
            default:
                return false;
        }
    }
}