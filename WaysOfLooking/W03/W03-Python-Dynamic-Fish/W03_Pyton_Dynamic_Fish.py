
import json

class RockPaperScissors:
    game_json = {}

    def __init__(self):
        with open("C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/SSoT/rps.json", "r") as json_file:
            jo = json.load(json_file)
            self.game_json = jo["rock-paper-scissors"]

    def calculate_game_score(self, strategy_guide):
        total_score = 0
        for i in range(0, len(strategy_guide), 5):
            opponent_choice = strategy_guide[i]
            player_choice = strategy_guide[i + 2]
            round_score = self.calculate_round_score(opponent_choice, player_choice)
            print("Round Score: " + str(round_score))
            total_score += round_score
        return total_score

    def calculate_round_score(self, opponent_choice, player_choice):
        outcomes = self.game_json["rules"]["outcomes"]
        shapes = self.game_json["rules"]["shapes"]
        opponent_shape = next((s for s in shapes if s["opp_code"] == opponent_choice), None)
        player_shape = next((s for s in shapes if s["player_code"] == player_choice), None)

        if player_shape["wins_against"] == opponent_shape["opp_code"]:
            return outcomes["win"] + player_shape["score"]
        elif opponent_shape["wins_against"] == player_shape["opp_code"]:
            return outcomes["loss"] + player_shape["score"]
        else:
            return outcomes["draw"] + player_shape["score"]

    def get_strategy_guide(self):
        games = self.game_json["rules"]["games"]
        rounds = games["rounds"]
        strategy_guide = ""
        for round in rounds:
            strategy_guide += round["opp_code"] + " " + round["player_code"] + "\r\n"
        return strategy_guide


if __name__ == "__main__":
    rps = RockPaperScissors()
    strategy_guide = rps.get_strategy_guide()
    total_score = rps.calculate_game_score(strategy_guide)
    print("Total score: " + str(total_score))
