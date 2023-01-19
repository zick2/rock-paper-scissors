<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/" xml:space="preserve">
        <FileSet><FileSetFiles><FileSetFile>
            <RelativePath>Program.fs</RelativePath>
            <FileContents><xsl:apply-templates select="rock-paper-scissors"/></FileContents>
        </FileSetFile></FileSetFiles></FileSet>
    </xsl:template>

    <xsl:template match="rock-paper-scissors">
        <xsl:apply-templates select="rules/shapes" mode="init"/>
        <xsl:apply-templates select="rules/outcomes" mode="init"/>
        <xsl:apply-templates select="rules/outcomes" mode="funcs"/>
        <xsl:apply-templates select="rules/games" mode="conclusion"/>
    </xsl:template>

    <xsl:template match="outcomes" mode="init">
        <xsl:text>&#10;&#10;let win_score = </xsl:text><xsl:value-of select="win"/>
        <xsl:text>&#10;let loss_score = </xsl:text><xsl:value-of select="loss"/>
        <xsl:text>&#10;let draw_score = </xsl:text><xsl:value-of select="draw"/>
    </xsl:template>

    <xsl:template match="shapes" mode="init">
        <xsl:text>&#10;&#10;let player_</xsl:text><xsl:value-of select="name"/><xsl:text>_code = "</xsl:text><xsl:value-of select="player_code"/>
        <xsl:text>"&#10;let opp_</xsl:text><xsl:value-of select="name"/><xsl:text>_code = "</xsl:text><xsl:value-of select="opp_code"/>
    </xsl:template>

    <xsl:template match="outcomes" mode="funcs">        
        <xsl:text>&#10;&#10;// Function to check if player wins</xsl:text>
        <xsl:text>&#10;let PlayerWins (opponent_choice: char) (player_choice:char) =</xsl:text>
        <xsl:text>&#10;    match (opponent_choice, player_choice) with</xsl:text>
        <xsl:apply-templates select="//rules/shapes" mode="playerWins"/>
        <xsl:text>&#10;    | _ -&gt; false&#10;</xsl:text>
        <xsl:text>&#10;// Function to check if player loses</xsl:text>
        <xsl:text>&#10;let PlayerLoses (opponent_choice: char) (player_choice:char) =</xsl:text>
        <xsl:text>&#10;    match (opponent_choice, player_choice) with</xsl:text>
        <xsl:apply-templates select="//rules/shapes" mode="playerLoses"/>
        <xsl:text>&#10;    | _ -&gt; false&#10;</xsl:text>
        <xsl:apply-templates select="//rules/outcomes" mode="calculateRoundScore"/>
        <xsl:text>&#10;let CalculateChoiceScore (player_code: char) =
    match player_code with</xsl:text>
        <xsl:apply-templates select="//rules/shapes" mode="choiceScore"/>
        <xsl:text>
    | _ -> 0
        
// Function to calculate the total score for the strategy guide
let CalculateGameScore (strategy_guide: string list) =
    let mutable total_score = 0
    for line in strategy_guide do
        let opponent_choice = line.[0]
        let player_choice = line.[2]
        let outcome_score = CalculateRoundScore opponent_choice player_choice

        let choice_score = CalculateChoiceScore player_choice
        let round_score = choice_score + outcome_score
        total_score &lt;- total_score + round_score

    total_score
</xsl:text>
    </xsl:template>
    
    

    <xsl:template match="shapes" mode="playerWins">
        <xsl:text>&#10;    | '</xsl:text><xsl:value-of select="wins_against"/><xsl:text>', '</xsl:text><xsl:value-of select="player_code"/><xsl:text>' -&gt; true</xsl:text>
    </xsl:template>

    <xsl:template match="shapes" mode="playerLoses">
        <xsl:text>&#10;    | '</xsl:text><xsl:value-of select="opp_code"/><xsl:text>', '</xsl:text><xsl:value-of select="//shapes[opp_code=current()/wins_against]/player_code"/><xsl:text>' -&gt; true</xsl:text>
    </xsl:template>

    <xsl:template match="shapes" mode="choiceScore">
        <xsl:text>&#10;    | '</xsl:text><xsl:value-of select="player_code"/><xsl:text>' -&gt; </xsl:text><xsl:value-of select="score"/>
    </xsl:template>

    <xsl:template match="outcomes" mode="calculateRoundScore">
        <xsl:text>&#10;// Function to calculate the score for a round
let CalculateRoundScore (opponent_choice: char) (player_choice: char) =
    if PlayerWins opponent_choice player_choice then
        win_score
    elif PlayerLoses opponent_choice player_choice then
        loss_score
    else
        draw_score
</xsl:text>        
    </xsl:template>

    <xsl:template match="games" mode="conclusion">
        
        <xsl:text>&#10;let strategy_guide = [</xsl:text><xsl:for-each select="rounds"><xsl:text> "</xsl:text><xsl:value-of select="opp_code"/><xsl:text>&#32;</xsl:text><xsl:value-of select="player_code"/><xsl:text>";</xsl:text><xsl:text></xsl:text></xsl:for-each><xsl:text>]</xsl:text>
        <xsl:text>&#10;let total_score = CalculateGameScore strategy_guide</xsl:text>
        <xsl:text>&#10;printfn "Total score: %d" total_score</xsl:text>
    </xsl:template>

</xsl:stylesheet>
