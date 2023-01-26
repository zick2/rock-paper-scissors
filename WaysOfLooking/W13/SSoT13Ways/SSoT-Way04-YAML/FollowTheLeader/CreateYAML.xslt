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
                        <xsl:text>../rules.yaml</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve">yaml:
  Hand Shapes:<xsl:for-each select="//shapes">
  - Shape Name: <xsl:value-of select="name"/>
    Code: <xsl:value-of select="player_code"/>
    Response Code: <xsl:value-of select="opp_code"/>
    Points: <xsl:value-of select="score"/></xsl:for-each>
  
  Possible Results:
    Choice Wins: <xsl:value-of select="//outcomes/win"/>
    Choice Loses: <xsl:value-of select="//outcomes/loss"/>
    Ends in Draws: <xsl:value-of select="//outcomes/draw"/>
    
  Example Games:
    Name: Example 1
    Example Rounds:<xsl:for-each select="//games/rounds">
    - Code: <xsl:value-of select="player_code"/>
      Response: <xsl:value-of select="opp_code"/></xsl:for-each>
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>
