using System;
using System.Linq;

class RockPaperScissors
{
    static int CalculateRoundScore(char opponentChoice, char playerChoice)
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

    static int CalculateGameScore(string strategyGuide)
    {
        int totalScore = 0;
        for (int i = 0; i < strategyGuide.Length; i += 2)
        {
            char opponentChoice = strategyGuide[i];
            char playerChoice = strategyGuide[i + 1];
            int roundScore = CalculateRoundScore(opponentChoice, playerChoice);
            totalScore += roundScore;
        }
        return totalScore;
    }

    static void Main(string[] args)
    {
        string strategyGuide = "AYBXCZ";
        int totalScore = CalculateGameScore(strategyGuide);
        Console.WriteLine("Total score: " + totalScore);
    }
}