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
  options:<xsl:for-each select="//shapes">
  - id: <xsl:value-of select="name"/>
    code1: <xsl:value-of select="player_code"/>
    code2: <xsl:value-of select="opp_code"/>
    value: <xsl:value-of select="score"/><xsl:text>&#10;</xsl:text>
</xsl:for-each>  
  win_lose_draw: <xsl:value-of select="//outcomes/win"/>-<xsl:value-of select="//outcomes/loss"/>-<xsl:value-of select="//outcomes/draw"/>
    
  tests:
    id: unit_test_1
    test_cases:<xsl:for-each select="//games/rounds">
    - code1: <xsl:value-of select="player_code"/>
      code2: <xsl:value-of select="opp_code"/><xsl:text>&#10;</xsl:text>
</xsl:for-each>
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>
