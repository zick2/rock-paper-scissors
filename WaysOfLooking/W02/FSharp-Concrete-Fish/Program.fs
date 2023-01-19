let player_Rock_code = "X"
let opp_Rock_code = "A"

let player_Paper_code = "Y"
let opp_Paper_code = "B"

let player_Scissors_code = "Z"
let opp_Scissors_code = "C"


// Function to check if player wins
let PlayerWins (opponent_choice: char) (player_choice: char) =
    match opponent_choice, player_choice with
    | 'A', 'Z' -> true
    | 'B', 'X' -> true
    | 'C', 'Y' -> true
    | _ -> false

// Function to check if player loses
let PlayerLosses (opponent_choice: char) (player_choice: char) =
    match opponent_choice, player_choice with
    | 'A', 'Y' -> true
    | 'B', 'Z' -> true
    | 'C', 'X' -> true
    | _ -> false

// Function to calculate the score for a single round
let CalculateRoundScore (opponent_choice: char) (player_choice: char) =
    if PlayerWins opponent_choice player_choice then
        6
    elif PlayerLosses opponent_choice player_choice then
        0
    else
        3

        
let CalculateChoiceSCore (player_code: char) =
    match player_code with
    | 'X' -> 1
    | 'Y' -> 2
    | 'Z' -> 3
    | _ -> 0
        
// Function to calculate the total score for the strategy guide
let CalculateGameScore (strategy_guide: string list) =
    let mutable total_score = 0
    for line in strategy_guide do
        let opponent_choice = line.[0]
        let player_choice = line.[2]
        let outcome_score = CalculateRoundScore opponent_choice player_choice

        let choice_score = CalculateChoiceSCore player_choice
        let round_score = choice_score + outcome_score
        total_score <- total_score + round_score

    total_score


let strategy_guide = ["A Y"; "B X"; "C Z"]
let total_score = CalculateGameScore strategy_guide
printfn "Total score: %d" total_score
