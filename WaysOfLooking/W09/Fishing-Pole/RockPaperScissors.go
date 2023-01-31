package main

import (
	"fmt"
)

const (
	playerRockCode = "X"
	opponentRockCode = "A"
	playerPaperCode = "Y"
	opponentPaperCode = "B"
	playerScissorsCode = "Z"
	opponentScissorsCode = "C")


 func calculateGameScore(strategyGuide string) int {
	var totalScore int
	for i := 0; i < len(strategyGuide); i += 2 {
		opponentChoice := string(strategyGuide[i])
		playerChoice := string(strategyGuide[i+1])
		outcomeScore := calculateRoundScore(opponentChoice, playerChoice)

		choiceScore := calculateChoiceScore(playerChoice)
		roundScore := choiceScore + outcomeScore
		fmt.Printf("Round Score: %v\r\n", roundScore)
		totalScore += roundScore
	}
	return totalScore
}
    
func calculateRoundScore(opponentChoice string, playerChoice string) int {
	if playerWins(opponentChoice, playerChoice) {
		return 6
	} else if playerLosses(opponentChoice, playerChoice) {
		return 0
	} else {
		return 3
	}
}

func calculateChoiceScore(playerChoice string) int {
		if playerChoice == playerRockCode {
		return 1
	} else 	if playerChoice == playerPaperCode {
		return 2
	} else 	if playerChoice == playerScissorsCode {
		return 3
	} else  {
		return 0
	}
}

func playerWins(opponentChoice string, playerChoice string) bool {
  if (opponentChoice == "A" && playerChoice == "Y") ||
(opponentChoice == "B" && playerChoice == "Z") ||
(opponentChoice == "C" && playerChoice == "X") {
   return true
  }
  return false
}

func playerLosses(opponentChoice string, playerChoice string) bool {
  if (opponentChoice == "B" && playerChoice == "X") ||
(opponentChoice == "C" && playerChoice == "Y") ||
(opponentChoice == "A" && playerChoice == "Z") {
    return true
  }
  return false
}
func main() {
	strategyGuide := "AYBXCZ"
	totalScore := calculateGameScore(strategyGuide)
	fmt.Printf("Total Score: %v", totalScore)
}
