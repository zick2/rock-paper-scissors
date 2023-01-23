Imports System.IO
Imports Newtonsoft.Json.Linq

Class RockPaperScissors
    Private Shared gameJson As JObject

    Shared Sub New()
        Dim jsonString = File.ReadAllText("C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/SSoT/rps.json")
        Dim jo = JObject.Parse(jsonString)
        gameJson = JObject.Parse(jo("rock-paper-scissors").ToString())
    End Sub

    Shared Sub Main(args As String())
        Dim strategyGuide = GetStrategyGuide()
        Dim totalScore = CalculateGameScore(strategyGuide)
        Console.WriteLine("Total score: " & totalScore)
    End Sub

    Shared Function CalculateGameScore(strategyGuide As String) As Integer
        Dim totalScore As Integer = 0
        For i As Integer = 0 To strategyGuide.Length - 1 Step 5
            Dim opponentChoice As Char = strategyGuide(i)
            Dim playerChoice As Char = strategyGuide(i + 2)
            Dim roundScore = CalculateRoundScore(opponentChoice, playerChoice)
            Console.WriteLine("Round Score: " & roundScore)
            totalScore += roundScore
        Next
        Return totalScore
    End Function

    Private Shared Function CalculateRoundScore(opponentChoice As Char, playerChoice As Char) As Integer
        Dim outcomes = gameJson("rules")("outcomes")
        Dim shapes = gameJson("rules")("shapes")
        Dim opponentShape = shapes.FirstOrDefault(Function(s) $"{s("opp_code")}" = opponentChoice.ToString())
        Dim playerShape = shapes.Where(Function(s) s("player_code").ToString() = playerChoice.ToString()).FirstOrDefault()

        If playerShape("wins_against").ToString() = opponentShape("opp_code").ToString() Then
            Return CInt(outcomes("win")) + CInt(playerShape("score"))
        ElseIf opponentShape("wins_against").ToString() = playerShape("opp_code").ToString() Then
            Return CInt(outcomes("loss")) + CInt(playerShape("score"))
        Else
            Return CInt(outcomes("draw")) + CInt(playerShape("score"))
        End If
    End Function

    Private Shared Function GetStrategyGuide() As String
        Dim games = gameJson("rules")("games")
        Dim rounds = games("rounds")
        Dim strategyGuide As String = ""
        For Each round In rounds
            strategyGuide += round("opp_code").ToString() + " " + round("player_code").ToString() + vbCrLf
        Next
        Return strategyGuide
    End Function
End Class
