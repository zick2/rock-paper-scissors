open Newtonsoft.Json.Linq
open System
open System.IO

module RockPaperScissors =
    let gameJson =
        let jsonString = File.ReadAllText("C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/SSoT/rps.json")
        let jo = JObject.Parse(jsonString)
        jo.["rock-paper-scissors"]

    let calculateRoundScore opponentChoice playerChoice =
        let outcomes = gameJson.["rules"]["outcomes"]
        let shapes = gameJson.["rules"]["shapes"]
        let opponentShape = shapes |> Seq.find (fun s -> s.["opp_code"].ToString() = opponentChoice.ToString())
        let playerShape = shapes |> Seq.find (fun s -> s.["player_code"].ToString() = playerChoice.ToString())

        if playerShape.["wins_against"].ToString() = opponentShape.["opp_code"].ToString() then
            int outcomes.["win"] + int playerShape.["score"]
        elif opponentShape.["wins_against"].ToString() = playerShape.["opp_code"].ToString() then
            int outcomes.["loss"] + int playerShape.["score"]
        else
            int outcomes.["draw"] + int playerShape.["score"]

    let calculateGameScore (strategyGuide:string) =
        let rec loop i totalScore =
            if i >= strategyGuide.Length then totalScore
            else
                let opponentChoice = strategyGuide.[i]
                let playerChoice = strategyGuide.[i + 2]
                let roundScore = calculateRoundScore opponentChoice playerChoice
                printfn "Round Score: %d" roundScore
                loop (i+5) (totalScore + roundScore)
        loop 0 0

    let getStrategyGuide() =
        let games = gameJson.["rules"]["games"]
        let rounds = games.["rounds"]
        let strategyGuide = rounds |> Seq.map (fun round -> round.["opp_code"].ToString() + " " + round.["player_code"].ToString() + "\r\n") |> Seq.reduce (+)
        strategyGuide

    [<EntryPoint>]
    let main argv =
        let strategyGuide = getStrategyGuide()
        let totalScore = calculateGameScore strategyGuide
        printfn "Total score: %d" totalScore
        0 // return an integer exit
