<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8"/>

    <xsl:template match="/" xml:space="preserve">
        <FileSet><FileSetFiles><FileSetFile>
            <RelativePath>Program.vb</RelativePath>
            <FileContents><xsl:apply-templates select="/" mode="top"/></FileContents>
        </FileSetFile></FileSetFiles></FileSet>
    </xsl:template>
    
    <xsl:template match="/" mode="top">Imports System

Module test

    <xsl:text>' Helpful Constants</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="rock-paper-scissors/rules/shapes">
            <xsl:text>    Dim </xsl:text>
            <xsl:value-of select="concat('player_',name,'_code')"/>
            <xsl:text> As String = "</xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>"</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="rock-paper-scissors/rules/shapes">
            <xsl:text>    Dim </xsl:text>
            <xsl:value-of select="concat('opp_',name,'_code')"/>
            <xsl:text> As String = "</xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text>"</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>    ' Function to calculate the total score for the strategy guide</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>    Function CalculateGameScore(strategy_guide As List(Of String)) As Integer</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>        Dim total_score As Integer = 0</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>        For Each line In strategy_guide</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>            Dim opponent_choice As Char = line(0)</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>            Dim player_choice As Char = line(2)</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>            Dim outcome_score As Integer = CalculateRoundScore(opponent_choice, player_choice)</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>            Dim choice_score As Integer = CalculateChoiceSCore(player_choice)</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>            Dim round_score As Integer = choice_score + outcome_score</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>            Console.WriteLine($"Round Score: {round_score}")</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>            total_score += round_score</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>        Next</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>        Return total_score</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>    End Function</xsl:text>
        <xsl:text>&#10;&#10;</xsl:text>
        <xsl:text>    ' Function to calculate the score for a single round</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>    Function CalculateRoundScore(opponent_choice As Char, player_choice As Char) As Integer</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>        If PlayerWins(opponent_choice, player_choice) Then</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>            Return </xsl:text>
        <xsl:value-of select="//outcomes/win"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>        ElseIf PlayerLosses(opponent_choice, player_choice) Then</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>            Return </xsl:text>
        <xsl:value-of select="//outcomes/loss"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>        Else</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>            Return </xsl:text>
        <xsl:value-of select="//outcomes/draw"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>        End If</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>    End Function</xsl:text>
        <xsl:text>&#10;&#10;</xsl:text>
        <xsl:text>    Function CalculateChoiceSCore(player_choice As Char) As Integer</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="rock-paper-scissors/rules/shapes">
            <xsl:text>        If player_choice = </xsl:text>
            <xsl:value-of select="concat('player_',name,'_code')"/>
            <xsl:text> Then</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>            Return </xsl:text>
            <xsl:value-of select="score"/>
            <xsl:text></xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>        End If</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>    End Function</xsl:text>
        <xsl:text>&#10;&#10;</xsl:text>
        <xsl:text>    Function PlayerWins(opp_code As Char, player_code As Char) As Boolean</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="rock-paper-scissors/rules/shapes">
            <xsl:text>        If (opp_code = </xsl:text>
            <xsl:value-of select="concat('opp_',//shapes[opp_code=current()/wins_against]/name,'_code')"/>
            <xsl:text> And player_code = </xsl:text>
            <xsl:value-of select="concat('player_',name,'_code')"/>
            <xsl:text>) Then</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>            Return True</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>        End If</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>        Return False</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>    End Function</xsl:text>
        <xsl:text>&#10;&#10;</xsl:text>
        <xsl:text>    Function PlayerLosses(opp_code As Char, player_code As Char) As Boolean</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="rock-paper-scissors/rules/shapes">
            <xsl:text>        If (opp_code = </xsl:text>
            <xsl:value-of select="concat('opp_',name,'_code')"/>
            <xsl:text> And player_code = </xsl:text>
            <xsl:value-of select="concat('player_',//shapes[opp_code=current()/wins_against]/name,'_code')"/>
            <xsl:text>) Then</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>            Return True</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>        End If</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>        Return False</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>    End Function</xsl:text>
        <xsl:text>&#10;</xsl:text>

    ' Calculate total score
    Dim strategy_guide As New List(Of String) From {"<xsl:for-each select="//games/rounds"><xsl:value-of select="opp_code" />&#32;<xsl:value-of select="player_code" />"<xsl:if test="position() != last()"><xsl:text xml:space="preserve">,"</xsl:text></xsl:if></xsl:for-each>}
    Dim total_score As Integer = CalculateGameScore(strategy_guide)

    ' Print total score
    Sub Main(args As String())
        Console.WriteLine($"Total Score: {total_score}")
    End Sub

End Module</xsl:template>

</xsl:stylesheet>