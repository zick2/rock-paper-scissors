using System;
using System.Linq;

class RockPaperScissors
{

    static void Main(string[] args)
    {
        string strategyGuide = "AYBXCZ";
        int totalScore = CalculateGameScore(strategyGuide);
        Console.WriteLine($"Total Score: {totalScore}");
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
            Console.WriteLine($"Round Score: {roundScore}");
        }
        return totalScore;
    }
    
    static int CalculateRoundScore(char opponentChoice, char playerChoice)
    {
        int shapeScore = 0;
        int outcomeScore = 0;
        switch (playerChoice)
        {
            case 'X':
                shapeScore = 1;
                break;
            case 'Y':
                shapeScore = 2;
                break;
            case 'Z':
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
                return playerChoice == 'Z';
            case 'B':
                return playerChoice == 'X';
            case 'C':
                return playerChoice == 'Y';
            default:
                return false;
        }
    }


}