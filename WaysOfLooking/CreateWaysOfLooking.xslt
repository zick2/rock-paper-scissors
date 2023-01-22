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
                <xsl:for-each select="//WaysOfLooking">
                    <FileSetFile>
                        <RelativePath>
                            <xsl:value-of select="Directory"/>
                            <xsl:text>/README.md</xsl:text>
                        </RelativePath>
                        <OverwriteMode>Never</OverwriteMode>
                        <xsl:element name="FileContents" xml:space="preserve">
- <xsl:value-of select="Name"/>
- <xsl:value-of select="Prompt"/>
- <xsl:value-of select="FishingPrompt"/>
- <xsl:value-of select="PolePrompt"/>
                            
SUMMARY:                            
</xsl:element>
                    </FileSetFile>
                </xsl:for-each>
                <FileSetFile>
                    <RelativePath>
                        <xsl:text>WaysOfLooking.txt</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve"><xsl:for-each select="//WaysOfLooking">
                        - <xsl:value-of select="Name"/>
                    </xsl:for-each>
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>
