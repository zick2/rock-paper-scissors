using Newtonsoft.Json.Linq;
using System;
using System.Linq;

class RockPaperScissors
{
    private static JObject gameJson;

    static RockPaperScissors()
    {
        string jsonString = File.ReadAllText("C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/SSoT/rps.json");
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
            Console.WriteLine($"Round Score: {roundScore}");
            totalScore += roundScore;
        }
        return totalScore;
    }
    private static int CalculateRoundScore(char opponentChoice, char playerChoice)
    {
        var outcomes = gameJson["rules"]["outcomes"];
        var shapes = gameJson["rules"]["shapes"];
        
        var playerShape = shapes.First(s => $"{s["player_code"]}"[0] == playerChoice);
        var shapeScore = (int)playerShape["score"];
        var outcomeScore = 0;

        var opponentShape = shapes.First(s => $"{s["opp_code"]}"[0] == opponentChoice);

        if ($"{playerShape["wins_against"]}" == $"{opponentShape["opp_code"]}")
        {
            outcomeScore = (int)outcomes["win"];
        }
        else if ($"{opponentShape["wins_against"]}" == $"{playerShape["opp_code"]}")
        {
            outcomeScore = (int)outcomes["loss"];
        }
        else outcomeScore = (int)outcomes["draw"];

        return outcomeScore + shapeScore;
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