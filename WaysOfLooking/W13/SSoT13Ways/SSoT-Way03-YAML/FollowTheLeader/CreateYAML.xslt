<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
                >
    <xsl:output method="xml" indent="yes"/>
    <xsl:include href="../CommonXsltTemplates.xslt"/>
    <xsl:param name="output-filename" select="'output.txt'" />
    <xsl:variable name="data" select="/" />

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
                    <xsl:element name="FileContents" xml:space="preserve">concise-yaml:
  - desc: s1=floor(max_pt/initial_divider), s{index} = s1 + (increment * {index} * (alternate ? -1 or 1)), s3 = s1 + (...)...
  <xsl:for-each select="//shapes">
  - s<xsl:value-of select="position()"/>: <xsl:value-of select="name"/></xsl:for-each>
                        
  - max_pt: <xsl:for-each select="//shapes" xml:space="default">
      <xsl:sort select="score" data-type="number" order="descending"/>
      <xsl:if test="position() = 1">
          <xsl:value-of select="score + //outcomes/win" />
      </xsl:if></xsl:for-each>
  - initial_divider: 9
  - increment: 1
  - alternate: false
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>
