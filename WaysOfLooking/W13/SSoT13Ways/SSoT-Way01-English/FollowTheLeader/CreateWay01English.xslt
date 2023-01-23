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
                        <xsl:text>../README.md</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve"># Advent of Code - Rock, Paper Scissors

In this version, the only rules for the input format are that it contain these 6 sets of data, surrounded by parentheses.

 - shape, names, separated, by commas
 - player, codes, separated, by commas
 - opponent, codes
 - shape, scores
 - wins, againt, player, codes
 - outcome, scores

Like this: These rules that define the traditiona game with the sames (<xsl:for-each select="//shapes"><xsl:value-of select="name"/><xsl:if test="position() != last()">, </xsl:if><xsl:if test="position() +1 = last()">and </xsl:if></xsl:for-each>). 

Each shape has a unique code for the player (<xsl:for-each select="//shapes" xml:space="default">
    <xsl:value-of select="player_code"/><xsl:if test="position() != last()">, </xsl:if><xsl:if test="position() +1 = last()">and </xsl:if>
</xsl:for-each>) and opponent (<xsl:for-each select="//shapes"  xml:space="default">
    <xsl:value-of select="opp_code"/><xsl:if test="position() != last()">, </xsl:if><xsl:if test="position() +1 = last()">and </xsl:if>
</xsl:for-each>) to use. Each shape also has a score (<xsl:for-each select="//shapes"  xml:space="default"><xsl:value-of select="score"/>
    <xsl:if test="position() != last()">, </xsl:if><xsl:if test="position() +1 = last()">and </xsl:if>
</xsl:for-each>) and a shape that it wins against (<xsl:for-each select="//shapes"  xml:space="default"><xsl:value-of select="wins_against"/><xsl:if test="position() != last()">, </xsl:if><xsl:if test="position() +1 = last()">and </xsl:if>
</xsl:for-each>). The game also has specific outcomes for win, loss, and draw with scores of (<xsl:value-of select="//outcomes/win" />, <xsl:value-of select="//outcomes/loss" /> and <xsl:value-of select="//outcomes/draw" />) respectively.

</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>
