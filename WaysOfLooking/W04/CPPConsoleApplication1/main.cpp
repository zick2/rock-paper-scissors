#include <iostream>
#include <vector>

std::vector<std::string> strategy_guide = { "A Y","B X","C Z" };

// Helpful Constants
const std::string player_Rock_code = "X";
const std::string opp_Rock_code = "A";
const std::string player_Paper_code = "Y";
const std::string opp_Paper_code = "B";
const std::string player_Scissors_code = "Z";
const std::string opp_Scissors_code = "C";

// Function to calculate the total score for the strategy guide
int CalculateGameScore(std::vector<std::string> strategy_guide) {
    int total_score = 0;
    for (auto line : strategy_guide) {
        std::string opponent_choice = line[0];
        std::string player_choice = line[2];
        int outcome_score = CalculateRoundScore(opponent_choice, player_choice);
        int choice_score = CalculateChoiceSCore(player_choice);
        int round_score = choice_score + outcome_score;
        std::cout << round_score << std::endl;
        total_score += round_score;
    }
    return total_score;
}

// Function to calculate the score for a single round
int CalculateRoundScore(std::string opponent_choice, std::string player_choice) {
    if (PlayerWins(opponent_choice, player_choice)) {
        return 6;
    }
    else if (PlayerLosses(opponent_choice, player_choice)) {
        return 0;
    }
    else {
        return 3;
    }
}

int CalculateChoiceSCore(std::string player_code) {
    if (player_code == player_Rock_code) {
        return 1;
    }
    if (player_code == player_Paper_code) {
        return 2;
    }
    if (player_code == player_Scissors_code) {
        return 3;
    }
}

// Function to check if the round is a win
bool PlayerWins(std::string opp_code, std::string player_code) {
    if ((opp_code == opp_Scissors_code && player_code == player_Rock_code)
        || (opp_code == opp_Rock_code && player_code == player_Paper_code)
        || (opp_code == opp_Paper_code && player_code == player_Scissors_code)) {
        return true;
    }
    else {
        return false;
    }
}

// Function to check if the round is a loss
bool PlayerLosses(std::string opp_code, std::string player_code) {
    if ((opp_code == opp_Rock_code && player_code == player_Scissors_code)
        || (opp_code == opp_Paper_code && player_code == player_Rock_code)
        || (opp_code == opp_Scissors_code && player_code == player_Paper_code)) {
        return true;
    }
    else {
        return false;
    }
}


int main() {
    // Calculate total score
    int total_score = CalculateGameScore(strategy_guide);

    // Print total score
    std::cout << "Total Score: " << total_score << std::endl;
    return 0;
}
