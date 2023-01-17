using Newtonsoft.Json.Linq;
using System;
using System.Linq;

class RockPaperScissors
{
    private static JObject gameJson;

    static RockPaperScissors()
    {
        string jsonString = File.ReadAllText("../../../../../../SSoT/rps.json");
        var jo = JObject.Parse(jsonString);
        gameJson = JObject.Parse(jo["rock-paper-scissors"].ToString());
    }

    static void Main(string[] args)
    {
        string strategyGuide = GetStrategyGuide();
        int totalScore = CalculateGameScore(strategyGuide);
        Console.WriteLine("Total score: " + totalScore);
    }

    static int CalculateGameScore(string strategyGuide)
    {
        int totalScore = 0;
        for (int i = 0; i < strategyGuide.Length; i += 5)
        {
            char opponentChoice = strategyGuide[i];
            char playerChoice = strategyGuide[i + 2];
            int roundScore = CalculateRoundScore(opponentChoice, playerChoice);
            totalScore += roundScore;
        }
        return totalScore;
    }
    private static int CalculateRoundScore(char opponentChoice, char playerChoice)
    {
        var outcomes = gameJson["rules"]["outcomes"];
        var shapes = gameJson["rules"]["shapes"];
        var opponentShape = shapes.FirstOrDefault(s => $"{s["opp_code"]}" == opponentChoice.ToString());
        var playerShape = shapes.First(s => s["player_code"].ToString() == playerChoice.ToString());

        if (playerShape["wins_against"].ToString() == opponentShape["opp_code"].ToString())
        {
            return (int)outcomes["win"] + (int)playerShape["score"];
        }
        else if (opponentShape["wins_against"].ToString() == playerShape["opp_code"].ToString())
        {
            return (int)outcomes["loss"] + (int)playerShape["score"];
        }
        else return (int)outcomes["draw"] + (int)playerShape["score"];
    }

    private static string GetStrategyGuide()
    {
        var games = gameJson["rules"]["games"];
        var rounds = games["rounds"];
        var strategyGuide = "";
        foreach (var round in rounds)
        {
            strategyGuide += round["opp_code"].ToString() + " " + round["player_code"].ToString() + "\r\n";
        }
        return strategyGuide;
    }
}