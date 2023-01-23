
                        
player_Rock_code = "X"
opp_Rock_code = "A"
        
player_Paper_code = "Y"
opp_Paper_code = "B"
        
player_Scissors_code = "Z"
opp_Scissors_code = "C"
        
# Function to calculate the total score for the strategy guide
def CalculateGameScore(strategy_guide):
    total_score = 0
    for line in strategy_guide:
        opponent_choice = line[0]
        player_choice = line[2]
        outcome_score = CalculateRoundScore(opponent_choice, player_choice)

        choice_score = CalculateChoiceSCore(player_choice)
        round_score = choice_score + outcome_score
        print("Round Score: " + str(round_score))
        total_score += round_score
    return total_score

# Function to calculate the score for a single round
def CalculateRoundScore(opponent_choice, player_choice):
    if PlayerWins(opponent_choice, player_choice):
        return 6
    elif PlayerLosses(opponent_choice, player_choice):
        return 0
    else:
        return 3

def CalculateChoiceSCore(player_code):
    if player_code == player_Rock_code:
        return 1
    if player_code == player_Paper_code:
        return 2
    if player_code == player_Scissors_code:
        return 3
# Function to check if the round is a win
def PlayerWins(opp_code, player_code):
    if ((opp_code == opp_Scissors_code and player_code == player_Rock_code) 
            or (opp_code == opp_Rock_code and player_code == player_Paper_code) 
            or (opp_code == opp_Paper_code and player_code == player_Scissors_code)):
        return True
    else:
        return False

# Function to check if the round is a win
def PlayerLosses(opp_code, player_code):
    if ((opp_code == opp_Rock_code and player_code == player_Scissors_code) 
            or (opp_code == opp_Paper_code and player_code == player_Rock_code) 
            or (opp_code == opp_Scissors_code and player_code == player_Paper_code)):
        return True
    else:
        return False


# Example strategy guide
strategy_guide = ['A Y', 'B X', 'C Z']

# Calculate total score
total_score = CalculateGameScore(strategy_guide)

# Print total score
print("Total Score: " + str(total_score))