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
  shapes:<xsl:for-each select="//shapes">
  - name: <xsl:value-of select="name"/>
    opp_code: <xsl:value-of select="opp_code"/>
    player_code: <xsl:value-of select="player_code"/>
    score: <xsl:value-of select="score"/></xsl:for-each>
  
  outcomes:
    win: <xsl:value-of select="//outcomes/win"/>
    loss: <xsl:value-of select="//outcomes/loss"/>
    draw: <xsl:value-of select="//outcomes/draw"/>
    
  games:
    name: Example Game
    rounds:<xsl:for-each select="//games/rounds">
    - player_code: <xsl:value-of select="player_code"/>
      opp_code: <xsl:value-of select="opp_code"/></xsl:for-each>
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>
