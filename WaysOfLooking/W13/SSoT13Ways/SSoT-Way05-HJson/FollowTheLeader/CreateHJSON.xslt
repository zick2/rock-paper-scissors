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
                        <xsl:text>../rules.hjson</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve">Game: {
  HandShapes: [<xsl:for-each select="//shapes" xml:space="default">{
    Name: <xsl:value-of select="name"/>
    ResponseCode: <xsl:value-of select="player_code"/>
    Code: <xsl:value-of select="opp_code"/>
    Points: <xsl:value-of select="score"/><xsl:text>&#10;  }</xsl:text>
  <xsl:if test="position() != last()">,</xsl:if>
</xsl:for-each>  
  ],
  
  OutcomeResults: {
    Win: <xsl:value-of select="//outcomes/win"/>
    Loss: <xsl:value-of select="//outcomes/loss"/>
    Draw: <xsl:value-of select="//outcomes/draw"/>
  },
    
  ExampleGames: [{
    Name: <xsl:value-of select="//games/name" />
    ExampleRounds:[<xsl:for-each select="//games/rounds">{
      ResponseCode: <xsl:value-of select="player_code"/>
      Code: <xsl:value-of select="opp_code"/><xsl:text>&#10;    }</xsl:text><xsl:if test="position() != last()">,</xsl:if></xsl:for-each>
    ]
  }]
}
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>
