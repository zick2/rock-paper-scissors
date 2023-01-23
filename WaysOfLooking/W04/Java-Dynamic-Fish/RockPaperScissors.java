import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;

public class RockPaperScissors {
    private static JSONObject gameJson;

    static {
        try {
            File jsonFile = new File("C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/SSoT/rps.json");
            Scanner sc = new Scanner(jsonFile);
            String jsonString = "";
            while(sc.hasNextLine()){
                jsonString += sc.nextLine();
            }
            sc.close();
            JSONObject jo = new JSONObject(jsonString);
            gameJson = jo.getJSONObject("rock-paper-scissors");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String strategyGuide = GetStrategyGuide();
        int totalScore = CalculateGameScore(strategyGuide);
        System.out.println("Total score: " + totalScore);
    }

     static int CalculateGameScore(String strategyGuide) {
        int totalScore = 0;
        for (int i = 0; i < strategyGuide.length(); i += 2) {
            char opponentChoice = strategyGuide.charAt(i);
            char playerChoice = strategyGuide.charAt(i + 1);
            int roundScore = CalculateRoundScore(opponentChoice, playerChoice);
            System.out.println("Round Score: " + roundScore);
            totalScore += roundScore;
        }
        return totalScore;
    }

     private static int CalculateRoundScore(char opponentChoice, char playerChoice) {
        JSONObject outcomes = gameJson.getJSONObject("rules").getJSONObject("outcomes");
        JSONArray shapes = gameJson.getJSONObject("rules").getJSONArray("shapes");
        JSONObject opponentShape = new JSONObject();
        JSONObject playerShape = new JSONObject();
        for (int i = 0; i < shapes.length(); i++) {
            JSONObject shape = shapes.getJSONObject(i);
            if(shape.getString("opp_code").equals(Character.toString(opponentChoice))) {
                opponentShape = shape;
            }
            if(shape.getString("player_code").equals(Character.toString(playerChoice))){
                playerShape = shape;
            }
        }
        if (playerShape.getString("wins_against").equals(opponentShape.getString("opp_code"))) {
            return outcomes.getInt("win") + playerShape.getInt("score");
        }
        else if (opponentShape.getString("wins_against").equals(playerShape.getString("opp_code"))) {
            return outcomes.getInt("loss") + playerShape.getInt("score");
        }
        else return outcomes.getInt("draw") + playerShape.getInt("score");
    }


    private static String GetStrategyGuide() {
        JSONObject games = gameJson.getJSONObject("rules").getJSONObject("games");
        JSONArray rounds = games.getJSONArray("rounds");
        String strategyGuide = "";
        for (int i = 0; i < rounds.length(); i++) {
            JSONObject round = rounds.getJSONObject(i);
            strategyGuide += round.getString("opp_code") + round.getString("player_code");
        }
        return strategyGuide;
    }
}
