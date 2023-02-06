package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
)

type RockPaperScissors struct {
	gameJson map[string]interface{}
}

func NewRockPaperScissors() *RockPaperScissors {
	r := &RockPaperScissors{}

	file, err := ioutil.ReadFile("C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/SSoT/rps.json")
	if err != nil {
		fmt.Println(err)
		return nil
	}

	var data map[string]interface{}
	err = json.Unmarshal(file, &data)
	if err != nil {
		fmt.Println(err)
		return nil
	}

	r.gameJson = data["rock-paper-scissors"].(map[string]interface{})

	return r
}

func  (r *RockPaperScissors)  GetStrategyGuide() string {
    games := r.gameJson["rules"].(map[string]interface{})["games"].(map[string]interface{})
    rounds := games["rounds"].([]interface{})
    var strategyGuide string
    for _, round := range rounds {
        r := round.(map[string]interface{})
        strategyGuide += r["opp_code"].(string) + " " + r["player_code"].(string) + "\n"
    }
    return strategyGuide
}


func (r *RockPaperScissors) CalculateGameScore(strategyGuide string) int {
	totalScore := 0
	for i := 0; i < len(strategyGuide); i += 5 {
		opponentChoice := rune(strategyGuide[i])
		playerChoice := rune(strategyGuide[i+2])
		roundScore := r.CalculateRoundScore(opponentChoice, playerChoice)
		fmt.Println("Round Score: ", roundScore)
		totalScore += roundScore
	}
	return totalScore
}

func (r *RockPaperScissors) CalculateRoundScore(opponentChoice rune, playerChoice rune) int {
	outcomes := r.gameJson["rules"].(map[string]interface{})["outcomes"].(map[string]interface{})
	shapes := r.gameJson["rules"].(map[string]interface{})["shapes"].([]interface{})
	fmt.Printf("SHAPES: %v - %v, %v", shapes, opponentChoice, playerChoice)
	var opponentShape, playerShape map[string]interface{}
	for _, shape := range shapes {
	shapeMap := shape.(map[string]interface{})
	if string(opponentChoice) == shapeMap["opp_code"] {
		opponentShape = shapeMap
	}
	if string(playerChoice) == shapeMap["player_code"] {
		playerShape = shapeMap
	}
}

	fmt.Printf("JSON: %v\nPlayer: %v\nOpp: %v", outcomes, playerShape, opponentShape)

	if opponentShape["wins_against"] == playerShape["opp_code"] {
		return int(outcomes["win"].(float64)) + int(playerShape["score"].(float64))
	} else if playerShape["wins_against"] == opponentShape["opp_code"] {
		return int(outcomes["loss"].(float64)) + int(playerShape["score"].(float64))
	} else {
		return int(outcomes["draw"].(float64)) + int(playerShape["score"].(float64))
	}
}


func (r *RockPaperScissors) Main() int {
	strategyGuide := r.GetStrategyGuide()
	totalScore := r.CalculateGameScore(strategyGuide)
	fmt.Println("Total score: ", totalScore)
	return totalScore
}

func main() {
	r := NewRockPaperScissors()
	r.Main()	
}