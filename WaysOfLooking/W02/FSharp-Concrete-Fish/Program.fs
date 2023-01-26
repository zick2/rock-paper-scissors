let player_Rock_code = 'X'
let opp_Rock_code = 'A'

let player_Paper_code = 'Y'
let opp_Paper_code = 'B'

let player_Scissors_code = 'Z'
let opp_Scissors_code = 'C'


// Function to check if player wins
let PlayerWins (opponent_choice: char) (player_choice: char) =
   if (opponent_choice = opp_Rock_code && player_choice = player_Paper_code) ||
       (opponent_choice = opp_Paper_code && player_choice = player_Scissors_code) ||
       (opponent_choice = opp_Scissors_code && player_choice = player_Rock_code) then
        true
    else
        false

// Function to check if player loses
let PlayerLosses (opponent_choice: char) (player_choice: char) =
  if (opponent_choice = opp_Rock_code && player_choice = player_Scissors_code) ||
       (opponent_choice = opp_Paper_code && player_choice = player_Rock_code) ||
       (opponent_choice = opp_Scissors_code && player_choice = player_Paper_code) then
        true
    else
        false

// Function to calculate the score for a single round
let CalculateRoundScore (opponent_choice: char) (player_choice: char) =
    if PlayerWins opponent_choice player_choice then
        6
    elif PlayerLosses opponent_choice player_choice then
        0
    else
        3

        
let CalculateChoiceSCore (player_code: char) =    
    if player_code = player_Rock_code then
        1
    elif player_code = player_Paper_code then
        2
    elif player_code = player_Scissors_code then
        3
    else
        0
        
// Function to calculate the total score for the strategy guide
let CalculateGameScore (strategy_guide: string list) =
    let mutable total_score = 0
    for line in strategy_guide do
        let opponent_choice = line.[0]
        let player_choice = line.[2]
        let outcome_score = CalculateRoundScore opponent_choice player_choice

        let choice_score = CalculateChoiceSCore player_choice
        let round_score = choice_score + outcome_score
        printfn "Round score: %d" round_score
        
        total_score <- total_score + round_score


    total_score


let strategy_guide = ["A Y"; "B X"; "C Z"]
let total_score = CalculateGameScore strategy_guide
printfn "Total score: %d" total_score
