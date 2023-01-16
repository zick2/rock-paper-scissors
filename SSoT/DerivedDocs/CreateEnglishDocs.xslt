<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" media-type="text/markdown"/>
    <xsl:template match="/">
        <xsl:text># The game is called: </xsl:text>
        <xsl:value-of select="rock-paper-scissors/name"/>
        <xsl:text>&#10;&#10;</xsl:text>
        <xsl:apply-templates select="rock-paper-scissors/rules"/>
    </xsl:template>

    <xsl:template match="rules">
        <xsl:text>There are </xsl:text>
        <xsl:value-of select="count(shapes)"/>
        <xsl:text> shapes. They are </xsl:text>

        <xsl:text>&#10;</xsl:text>
        <xsl:text>## Shapes
</xsl:text>
        <xsl:apply-templates select="shapes"/>
        <xsl:text>## Outcomes
</xsl:text>
        <xsl:apply-templates select="outcomes"/>
        <xsl:text>## Sample Game
</xsl:text>
        <xsl:apply-templates select="games"/>
    </xsl:template>

    <xsl:template match="shapes">
        <xsl:value-of select="name"/>
        <xsl:text> (code: `</xsl:text>
        <xsl:value-of select="code"/>
        <xsl:text>`), </xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="outcomes">
        <xsl:text>The outcome scores are: Win: </xsl:text>
        <xsl:value-of select="win"/>
        <xsl:text>, Loss: </xsl:text>
        <xsl:value-of select="loss"/>
        <xsl:text>, Draw: </xsl:text>
        <xsl:value-of select="draw"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="games">
        <xsl:text>The sample game is called: </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="rounds">
            <xsl:text>- Opponent chose </xsl:text>
            <xsl:value-of select="//shapes[code=current()/opponent_code]/name"/>
            <xsl:text> (code </xsl:text>
            <xsl:value-of select="opponent_code"/>
            <xsl:text>), player chose </xsl:text>
            <xsl:value-of select="//shapes[code=current()/player_code]/name"/>
            <xsl:text> (code </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>)</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>the round was a </xsl:text>
            <xsl:value-of select="result"/>
            <xsl:text>, with a score of </xsl:text>
            <xsl:value-of select="score"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>      choice score: </xsl:text>
            <xsl:value-of select="choice_score"/>
            <xsl:text>, outcome score: </xsl:text>
            <xsl:value-of select="outcome_score"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>The final score is: </xsl:text>
        <xsl:value-of select="sum(//games/rounds/score)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
