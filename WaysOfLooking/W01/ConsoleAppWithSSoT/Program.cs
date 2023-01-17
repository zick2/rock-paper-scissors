using System;
using System.Linq;

class RockPaperScissors
{
    static int CalculateGameScore(string strategyGuide)
    {
        int totalScore = 0;
        for (int i = 0; i < strategyGuide.Length; i += 5)
        {
            char opponentChoice = strategyGuide[i];
            char playerChoice = strategyGuide[i + 2];
            int roundScore = RPSHelper.CalculateRoundScore(opponentChoice, playerChoice);
            totalScore += roundScore;
        }
        return totalScore;
    }

    static void Main(string[] args)
    {
        string strategyGuide = RPSHelper.TestGameStrategyGuide;
        int totalScore = CalculateGameScore(strategyGuide);
        Console.WriteLine("Total score: " + totalScore);
    }
}