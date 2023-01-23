<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8"/>

    <xsl:template match="/" xml:space="preserve">
        <FileSet><FileSetFiles><FileSetFile>
            <RelativePath>PythonApplicationWithSSoT.py</RelativePath>
            <FileContents><xsl:apply-templates select="/" mode="top"/></FileContents>
        </FileSetFile></FileSetFiles></FileSet>
    </xsl:template>
    
    <xsl:template match="/" mode="top">
strategy_guide = ["<xsl:for-each select="//games/rounds"><xsl:value-of select="opp_code" />&#32;<xsl:value-of select="player_code" />"<xsl:if test="position() != last()"><xsl:text xml:space="preserve">,"</xsl:text></xsl:if></xsl:for-each>]

# Helpful Constants<xsl:for-each select="//shapes">
player_<xsl:value-of select="name"/>_code = "<xsl:value-of select="player_code"/>"
opp_<xsl:value-of select="name"/>_code = "<xsl:value-of select="opp_code"/>"</xsl:for-each>
        
        <xsl:text>&#10;&#10;# Function to calculate the total score for the strategy guide&#10;</xsl:text>
        <xsl:text>def CalculateGameScore(strategy_guide):&#10;</xsl:text>
        <xsl:text>    total_score = 0&#10;</xsl:text>
        <xsl:text>    for line in strategy_guide:&#10;</xsl:text>
        <xsl:text>        opponent_choice = line[0]&#10;</xsl:text>
        <xsl:text>        player_choice = line[2]&#10;</xsl:text>
        <xsl:text>        outcome_score = CalculateRoundScore(opponent_choice, player_choice)&#10;</xsl:text>
        <xsl:text>        choice_score = CalculateChoiceSCore(player_choice)&#10;</xsl:text>
        <xsl:text>        round_score = choice_score + outcome_score&#10;</xsl:text>
        <xsl:text>        print("Round Score: " + str(round_score))&#10;</xsl:text>
        <xsl:text>        total_score += round_score&#10;</xsl:text>
        <xsl:text>    return total_score&#10;&#10;</xsl:text>
        <xsl:apply-templates select="//rules/outcomes"/>
    </xsl:template>

    <xsl:template match="//rules/outcomes">
        <xsl:text>&#10;# Function to calculate the score for a single round&#10;</xsl:text>
        <xsl:text>def CalculateRoundScore(opponent_choice, player_choice):&#10;</xsl:text>
        <xsl:text>    if PlayerWins(opponent_choice, player_choice):&#10;</xsl:text>
        <xsl:text>        return </xsl:text><xsl:value-of select="win"/>
        <xsl:text>&#10;    elif PlayerLosses(opponent_choice, player_choice):&#10;</xsl:text>
        <xsl:text>        return </xsl:text><xsl:value-of select="loss"/>
        <xsl:text>&#10;    else:&#10;</xsl:text>
        <xsl:text>        return </xsl:text><xsl:value-of select="draw"/>        
        <xsl:text>&#10;&#10;def CalculateChoiceSCore(player_code):&#10;</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:text>    if player_code == player_</xsl:text><xsl:value-of select="//shapes[player_code= current()/player_code]/name"/><xsl:text>_code:&#10;</xsl:text>
            <xsl:text>        return </xsl:text><xsl:value-of select="score"/><xsl:text>&#10;</xsl:text></xsl:for-each>
        <xsl:apply-templates select="//outcomes/win" />
        <xsl:apply-templates select="//outcomes/loss" />
    </xsl:template>

    <xsl:template match="//rules/outcomes/win">
        <xsl:text>&#10;# Function to check if the round is a win&#10;</xsl:text>
        <xsl:text>def PlayerWins(opp_code, player_code):&#10;</xsl:text>
        <xsl:text>    if (</xsl:text><xsl:for-each select="../../shapes">
            <xsl:text>(opp_code == opp_</xsl:text><xsl:value-of select="//shapes[opp_code = current()/wins_against]/name"/><xsl:text>_code and player_code == player_</xsl:text><xsl:value-of select="//shapes[player_code= current()/player_code]/name"/><xsl:text>_code)</xsl:text>
            <xsl:if test="position() != last()"><xsl:text> 
            or </xsl:text></xsl:if></xsl:for-each>
        <xsl:text>):&#10;</xsl:text>
        <xsl:text>        return True&#10;</xsl:text>
        <xsl:text>    else:&#10;</xsl:text>
        <xsl:text>        return False&#10;&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="//outcomes/loss">
        <xsl:text>&#10;# Function to check if the round is a win&#10;</xsl:text>
        <xsl:text>def PlayerLosses(opp_code, player_code):&#10;</xsl:text>
        <xsl:text>    if (</xsl:text>
        <xsl:for-each select="../../shapes">
            <xsl:text>(opp_code == opp_</xsl:text><xsl:value-of select="//shapes[opp_code = current()/opp_code]/name"/><xsl:text>_code and player_code == player_</xsl:text><xsl:value-of select="//shapes[opp_code = current()/wins_against]/name"/><xsl:text>_code)</xsl:text>
            <xsl:if test="position() != last()"><xsl:text> 
            or </xsl:text></xsl:if></xsl:for-each>
        <xsl:text>):&#10;</xsl:text>
        <xsl:text>        return True&#10;</xsl:text>
        <xsl:text>    else:&#10;</xsl:text>
        <xsl:text>        return False&#10;&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>