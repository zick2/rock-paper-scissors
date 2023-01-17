# ChatGPT Prompt

**Plase Note:** This is the ChatGPT Prompt that produceded the **Xslt Script CreateHelper.xslt** that produces the **RPSHelper.cs** file on build.

See main readme to see how the rps.xml file was produced, but...

Given the rps.xml file provided, with the rules for the game described, 
please write an XsltScript that can produce this RPSHelper.cs (shown below).

There was some back and forth, but the end result was the CreateHelper.xslt script that keeps THIS SPECIFIC CODE in sync with the SSoT moving forward.

```
public static class RPSHelper {
    public static int CalculateRoundScore(char opponentChoice, char playerChoice)
    {
        int playerScore = 0;
        int outcomeScore = 0;
        switch (playerChoice)
        {
            case 'X':
                playerScore = 1;
                break;
            case 'Y':
                playerScore = 2;
                break;
            case 'Z':
                playerScore = 3;
                break;
        }

        if (IsWin(opponentChoice, playerChoice))
        {
            outcomeScore = 6;
        }
        else if (IsLoss(opponentChoice, playerChoice))
        {
            outcomeScore = 0;
        }
        else
        {
            outcomeScore = 3;
        }
        return playerScore + outcomeScore;
    }

    static bool IsWin(char opponentChoice, char playerChoice)
    {
        switch (opponentChoice)
        {
            case 'A':
                return playerChoice == 'Y';
            case 'B':
                return playerChoice == 'Z';
            case 'C':
                return playerChoice == 'X';
            default:
                return false;
        }
    }

    static bool IsLoss(char opponentChoice, char playerChoice)
    {
        switch (opponentChoice)
        {
            case 'A':
                return playerChoice == 'X';
            case 'B':
                return playerChoice == 'Y';
            case 'C':
                return playerChoice == 'Z';
            default:
                return false;
        }
    }
}```