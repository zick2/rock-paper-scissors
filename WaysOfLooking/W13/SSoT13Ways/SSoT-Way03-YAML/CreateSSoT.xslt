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
                <xsl:for-each select="//options">
                    <xsl:value-of select="id" />
                    <xsl:if test="position() &lt; last()">, </xsl:if>
                </xsl:for-each>
            </name>
            <rules>
                <xsl:for-each select="//options">
                    <xsl:variable name="index" select="position()" />
                    <shapes>
                        <name>
                            <xsl:value-of select="id"/>
                        </name>
                        <opp_code>
                            <xsl:value-of select="code2"/>
                        </opp_code>
                        <player_code>
                            <xsl:value-of select="code1"/>
                        </player_code>
                        <wins_against>
                            <xsl:variable name="shape-position" select="position()" />
                            <xsl:choose>
                                <xsl:when test="position() = 1">
                                    <xsl:value-of select="//options[position() = count(//options)]/code2"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="//options[position() = $shape-position - 1]/code2"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </wins_against>
                        <score>
                            <xsl:value-of select="value"/>
                        </score>
                    </shapes>
                </xsl:for-each>
                <outcomes>
                    <win>
                        <xsl:value-of select="substring-before(//win_lose_draw, '-')"/>
                    </win>
                    <loss>
                        <xsl:value-of select="substring-before(substring-after(//win_lose_draw, '-'), '-')"/>
                    </loss>
                    <draw>
                        <xsl:value-of select="substring-after(substring-after(//win_lose_draw, '-'), '-')"/>
                    </draw>
                </outcomes>
            </rules>
        </rock-paper-scissors>
    </xsl:template>
</xsl:stylesheet>
