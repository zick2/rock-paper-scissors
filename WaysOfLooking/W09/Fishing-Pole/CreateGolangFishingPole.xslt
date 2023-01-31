<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
                >
    <xsl:output method="xml" indent="yes"/>
    <xsl:include href="../CommonXsltTemplates.xslt"/>
    <xsl:param name="output-filename" select="'output.txt'" />

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/*">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>
                        <xsl:text>RockPaperScissors.go</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve"><xsl:call-template name="rock-paper-scissors" />
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>


    <xsl:template name="rock-paper-scissors">
        <xsl:text>package main</xsl:text>
        <xsl:text>&#10;&#10;import (</xsl:text>
        <xsl:text>&#10;&#9;"fmt"</xsl:text>
        <xsl:text>&#10;)&#10;&#10;</xsl:text>

        <xsl:text>const (</xsl:text>
        <xsl:apply-templates select="rules/shapes"/>
        <xsl:text>)&#10;&#10;</xsl:text>

        <xsl:call-template name="calculateGameScore"/>
        <xsl:call-template name="calculateRoundScore"/>
        <xsl:call-template name="calculateChoiceScore"/>
        <xsl:call-template name="playerWins"/>
        <xsl:call-template name="playerLoses"/>

        <xsl:text>
func main() {</xsl:text>
        <xsl:text>&#10;&#9;strategyGuide := "AYBXCZ"</xsl:text>
        <xsl:text>&#10;&#9;totalScore := calculateGameScore(strategyGuide)</xsl:text>
        <xsl:text>&#10;&#9;fmt.Printf("Total Score: %v", totalScore)</xsl:text>
        <xsl:text>&#10;}</xsl:text>
    </xsl:template>

    <xsl:template match="shapes">
        <xsl:text>&#10;&#9;player</xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>Code = "</xsl:text>
        <xsl:value-of select="player_code"/>
        <xsl:text>"</xsl:text>
        <xsl:text>&#10;&#9;opponent</xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>Code = "</xsl:text>
        <xsl:value-of select="opp_code"/>
        <xsl:text>"</xsl:text>
    </xsl:template>

    <xsl:template name="calculateGameScore">
 func calculateGameScore(strategyGuide string) int {
	var totalScore int
	for i := 0; i &lt; len(strategyGuide); i += 2 {
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
    </xsl:template>


    <xsl:template name="playerWins">
        <xsl:text>
func playerWins(opponentChoice string, playerChoice string) bool {
</xsl:text>
        <xsl:text>  if </xsl:text>
        <xsl:for-each select="rules/shapes">
            <xsl:text>(opponentChoice == </xsl:text>
            <xsl:text>"</xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text>" &amp;&amp; playerChoice == </xsl:text>
            <xsl:text>"</xsl:text>
            <xsl:value-of select="//shapes[wins_against=current()/opp_code]/player_code"/>
            <xsl:text>"</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>) ||
</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>) {
   return true
  }
  return false
}
</xsl:text>
    </xsl:template>

    <xsl:template name="playerLoses">

        <xsl:text>
func playerLosses(opponentChoice string, playerChoice string) bool {
</xsl:text>
        <xsl:text>  if </xsl:text>
        <xsl:for-each select="rules/shapes">
            <xsl:text>(opponentChoice == </xsl:text>
            <xsl:text>"</xsl:text>
            <xsl:value-of select="//shapes[wins_against=current()/opp_code]/opp_code"/>
            <xsl:text>" &amp;&amp; playerChoice == </xsl:text>
            <xsl:text>"</xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>"</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>) ||
</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>) {
    return true
  }
  return false
}</xsl:text>
    </xsl:template>

    <xsl:template name="calculateRoundScore">
        <xsl:text>
func calculateRoundScore(opponentChoice string, playerChoice string) int {
	if playerWins(opponentChoice, playerChoice) {
		return </xsl:text>
        <xsl:value-of select="//outcomes/win"/>
        <xsl:text>
	} else if playerLosses(opponentChoice, playerChoice) {
		return </xsl:text>
        <xsl:value-of select="//outcomes/loss"/>
        <xsl:text>
	} else {
		return </xsl:text>
        <xsl:value-of select="//outcomes/draw"/>
        <xsl:text>
	}
}
</xsl:text>
    </xsl:template>

<xsl:template name="calculateChoiceScore">
  <xsl:text>
func calculateChoiceScore(playerChoice string) int {</xsl:text>
  <xsl:text>&#10;	</xsl:text>
  <xsl:for-each select="//rules/shapes">
    <xsl:text>	if playerChoice == player</xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>Code {&#10;		return </xsl:text>
    <xsl:value-of select="score"/>
    <xsl:text>&#10;	} else </xsl:text>
  </xsl:for-each>
  <xsl:text> {&#10;		return 0&#10;	}&#10;}&#10;</xsl:text>
</xsl:template>




</xsl:stylesheet>


