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

    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>
                        <xsl:text>single-source-of-truth.xml</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve">
    <xsl:apply-templates select="*">
    
    </xsl:apply-templates>
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>

    <xsl:template match="/*">
        <rock-paper-scissors>
            <name>
                <xsl:for-each select="//HandShapes">
                    <xsl:value-of select="Name" />
                    <xsl:if test="position() &lt; last()">, </xsl:if>
                </xsl:for-each>
            </name>
            <rules>
                <xsl:for-each select="//HandShapes">
                    <xsl:variable name="index" select="position()" />
                    <shapes>
                        <name>
                            <xsl:value-of select="Name"/>
                        </name>
                        <opp_code>
                            <xsl:value-of select="ResponseCode"/>
                        </opp_code>
                        <player_code>
                            <xsl:value-of select="Code"/>
                        </player_code>
                        <wins_against>
                            <xsl:variable name="shape-position" select="position()" />
                            <xsl:choose>
                                <xsl:when test="position() = 1">
                                    <xsl:value-of select="//HandShapes[position() = count(//HandShapes)]/ResponseCode"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="//HandShapes[position() = $shape-position - 1]/ResponseCode"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </wins_against>
                        <score>
                            <xsl:value-of select="Points"/>
                        </score>
                    </shapes>
                </xsl:for-each>
                <outcomes>
                    <win>
                        <xsl:value-of select="//OutcomeResults/Win"/>
                    </win>
                    <loss>
                        <xsl:value-of select="//OutcomeResults/Loss"/>
                    </loss>
                    <draw>
                        <xsl:value-of select="//OutcomeResults/Draw"/>
                    </draw>
                </outcomes>
            </rules>
        </rock-paper-scissors>
    </xsl:template>


</xsl:stylesheet>
