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
            <RelativePath>RPSHelper.cs</RelativePath>
            <FileContents><xsl:text>
public static class RPSHelper {
    public static string TestGameStrategyGuide { get { return @"</xsl:text><xsl:for-each select="//games/rounds"><xsl:value-of select="opp_code" />&#32;<xsl:value-of select="player_code" /><xsl:text xml:space="preserve">
</xsl:text>
</xsl:for-each><xsl:text>"; } }
    public static int CalculateRoundScore(char opponentChoice, char playerChoice)
    {
        int playerScore = 0;
        int outcomeScore = 0;
        switch (playerChoice)
        {</xsl:text><xsl:for-each select="rules/shapes"><xsl:text>
            case '</xsl:text><xsl:value-of select="player_code"/><xsl:text>': // </xsl:text>
            <xsl:value-of select="name" />
            <xsl:text>
                playerScore = </xsl:text><xsl:value-of select="score"/><xsl:text>;
                break;</xsl:text></xsl:for-each><xsl:text>
        }

        if (IsWin(opponentChoice, playerChoice))
        {
            outcomeScore = </xsl:text><xsl:value-of select="rules/outcomes/win"/><xsl:text>;
        }
        else if (IsLoss(opponentChoice, playerChoice))
        {
            outcomeScore = </xsl:text><xsl:value-of select="rules/outcomes/loss"/><xsl:text>;
        }
        else
        {
            outcomeScore = </xsl:text><xsl:value-of select="rules/outcomes/draw"/><xsl:text>;
        }
        return playerScore + outcomeScore;
    }

    static bool IsWin(char opponentChoice, char playerChoice)
    {
        switch (opponentChoice)
        {</xsl:text><xsl:for-each select="rules/shapes"><xsl:text>
            case '</xsl:text><xsl:value-of select="opp_code"/><xsl:text>': // </xsl:text>
            <xsl:value-of select="name" />
            <xsl:text>
                return playerChoice == '</xsl:text><xsl:value-of select="//shapes[wins_against=current()/opp_code]/player_code"/><xsl:text>';// </xsl:text>
            <xsl:value-of select="//shapes[wins_against=current()/opp_code]/name" />
            <xsl:text></xsl:text></xsl:for-each><xsl:text>
            default:
                return false;
        }
    }

    static bool IsLoss(char opponentChoice, char playerChoice)
    {
        switch (opponentChoice)
        {</xsl:text><xsl:for-each select="rules/shapes"><xsl:text>
            case '</xsl:text><xsl:value-of select="opp_code"/><xsl:text>': // </xsl:text>
            <xsl:value-of select="name" />
            <xsl:text>
                return playerChoice == '</xsl:text><xsl:value-of select="//shapes[opp_code=current()/wins_against]/player_code"/><xsl:text>';// </xsl:text>
            <xsl:value-of select="//shapes[opp_code=current()/wins_against]/name" />
            <xsl:text></xsl:text></xsl:for-each><xsl:text>
            default:
                return false;
        }
    }
}</xsl:text></FileContents>
            <OverwriteMode>Always</OverwriteMode>
        </FileSetFile>
    </FileSetFiles>
</FileSet>
    </xsl:template>
</xsl:stylesheet>
