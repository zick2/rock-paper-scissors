
public static class RPSHelper {
    public static string TestGameStrategyGuide { get { return @"A Y
B X
C Z
"; } }
    public static int CalculateRoundScore(char opponentChoice, char playerChoice)
    {
        int shapeScore = 0;
        int outcomeScore = 0;
        switch (playerChoice)
        {
            case 'X': // Rock
                shapeScore = 1;
                break;
            case 'Y': // Paper
                shapeScore = 2;
                break;
            case 'Z': // Scissors
                shapeScore = 3;
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
        return shapeScore + outcomeScore;
    }

    static bool IsWin(char opponentChoice, char playerChoice)
    {
        switch (opponentChoice)
        {
            case 'A': // Rock
                return playerChoice == 'Y';// Paper
            case 'B': // Paper
                return playerChoice == 'Z';// Scissors
            case 'C': // Scissors
                return playerChoice == 'X';// Rock
            default:
                return false;
        }
    }

    static bool IsLoss(char opponentChoice, char playerChoice)
    {
        switch (opponentChoice)
        {
            case 'A': // Rock
                return playerChoice == 'Z';// Scissors
            case 'B': // Paper
                return playerChoice == 'X';// Rock
            case 'C': // Scissors
                return playerChoice == 'Y';// Paper
            default:
                return false;
        }
    }
}