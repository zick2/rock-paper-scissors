Imports System

Module Program

    ' Helpful Constants
    Dim player_Rock_code As String = "X"
    Dim opp_Rock_code As String = "A"
    Dim player_Paper_code As String = "Y"
    Dim opp_Paper_code As String = "B"
    Dim player_Scissors_code As String = "Z"
    Dim opp_Scissors_code As String = "C"

    ' Function to calculate the total score for the strategy guide
    Function CalculateGameScore(strategy_guide As List(Of String)) As Integer
        Dim total_score As Integer = 0
        For Each line In strategy_guide
            Dim opponent_choice As Char = line(0)
            Dim player_choice As Char = line(2)
            Dim outcome_score As Integer = CalculateRoundScore(opponent_choice, player_choice)
            Dim choice_score As Integer = CalculateChoiceSCore(player_choice)
            Dim round_score As Integer = choice_score + outcome_score
            Console.WriteLine(round_score)
            total_score += round_score
        Next
        Return total_score
    End Function

    ' Function to calculate the score for a single round
    Function CalculateRoundScore(opponent_choice As Char, player_choice As Char) As Integer
        If PlayerWins(opponent_choice, player_choice) Then
            Return 6
        ElseIf PlayerLosses(opponent_choice, player_choice) Then
            Return 0
        Else
            Return 3
        End If
    End Function

    Function CalculateChoiceSCore(player_code As Char) As Integer
        If player_code = player_Rock_code Then
            Return 1
        ElseIf player_code = player_Paper_code Then
            Return 2
        ElseIf player_code = player_Scissors_code Then
            Return 3
        Else
            Return 0
        End If
    End Function

    ' Function to check if the round is a win
    Function PlayerWins(opp_code As Char, player_code As Char) As Boolean
        If ((opp_code = opp_Scissors_code And player_code = player_Rock_code) _
            Or (opp_code = opp_Rock_code And player_code = player_Paper_code) _
            Or (opp_code = opp_Paper_code And player_code = player_Scissors_code)) Then
            Return True
        Else
            Return False
        End If
    End Function

    ' Function to check if the round is a loss
    Function PlayerLosses(opp_code As Char, player_code As Char) As Boolean
        If ((opp_code = opp_Rock_code And player_code = player_Scissors_code) _
            Or (opp_code = opp_Paper_code And player_code = player_Rock_code) _
            Or (opp_code = opp_Scissors_code And player_code = player_Paper_code)) Then
            Return True
        Else
            Return False
        End If
    End Function

    ' Calculate total score
    Dim strategy_guide As New List(Of String) From {"A Y", "B X", "C Z"}
    Dim total_score As Integer = CalculateGameScore(strategy_guide)

    ' Print total score


    Sub Main(args As String())
        Console.WriteLine(total_score)
    End Sub
End Module