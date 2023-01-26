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
                <xsl:for-each select="//_x0020_">
                    <xsl:value-of select="name" />
                    <xsl:if test="position() &lt; last()">, </xsl:if>
                </xsl:for-each>
            </name>
            <rules>
                <xsl:for-each select="//Hand_x0020_Shapes">
                    <xsl:variable name="index" select="position()" />
                    <shapes>
                        <name>
                            <xsl:value-of select="Shape_x0020_Name"/>
                        </name>
                        <opp_code>
                            <xsl:value-of select="Response_x0020_Code"/>
                        </opp_code>
                        <player_code>
                            <xsl:value-of select="Code"/>
                        </player_code>
                        <wins_against>
                            <xsl:variable name="shape-position" select="position()" />
                            <xsl:choose>
                                <xsl:when test="position() = 1">
                                    <xsl:value-of select="//Hand_x0020_Shapes[position() = count(//Hand_x0020_Sahpes)]/opp_code"/>
                                </xsl:when>
                            <xsl:otherwise>
                                    <xsl:value-of select="//Hand_x0020_Shapes[position() = $shape-position - 1]/Response_x0020_Code"/>
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
                        <xsl:value-of select="//Possible_x0020_Results/Choice_x0020_Wins"/>
                    </win>
                    <loss>
                        <xsl:value-of select="//Possible_x0020_Results/Choice_x0020_Loses"/>
                    </loss>
                    <draw>
                        <xsl:value-of select="//Possible_x0020_Results/Choice_x0020_Draws"/>
                    </draw>
                </outcomes>
            </rules>
        </rock-paper-scissors>
    </xsl:template>

    <xsl:template name="parse-input-text">
        <xsl:param name="text"/>
        <xsl:param name="step" select="1"/>
        <xsl:variable name="extracted-text" select="substring-before(substring-after($text, '('), ')')"/>
        <xsl:variable name="element-name">
            <xsl:choose>
                <xsl:when test="$step = 1">shape</xsl:when>
                <xsl:when test="$step = 2">player_code</xsl:when>
                <xsl:when test="$step = 3">opponent_code</xsl:when>
                <xsl:when test="$step = 4">shape_score</xsl:when>
                <xsl:when test="$step = 5">wins_against</xsl:when>
                <xsl:when test="$step = 6">win_lose_draw</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$element-name}s">
            <xsl:call-template name="split-on-commas">
                <xsl:with-param name="values" select="$extracted-text" />
                <xsl:with-param name="element-name" select="$element-name" />
            </xsl:call-template>
        </xsl:element>

        <xsl:if test="$step &lt; 6">
            <xsl:call-template name="parse-input-text">
                <xsl:with-param name="text" select="substring-after($text, ')')" />
                <xsl:with-param name="step" select="$step + 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="split-on-commas">
        <xsl:param name="values" />
        <xsl:param name="element-name" select="'item'" />
        <xsl:variable name="delimiter" select="', '" />
        <xsl:choose>
            <xsl:when test="contains($values, $delimiter)">
                <xsl:element name="{$element-name}">
                    <xsl:value-of select="substring-before($values, $delimiter)" />
                </xsl:element>
                <xsl:call-template name="split-on-commas">
                    <xsl:with-param name="values" select="substring-after($values, $delimiter)" />
                    <xsl:with-param name="element-name" select="$element-name" />
                    <xsl:with-param name="delimiter" select="$delimiter" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{$element-name}">
                    <xsl:choose>
                        <xsl:when test="string-length(substring-after($values, 'and ')) > 0">
                            <xsl:value-of select="substring-after($values, 'and ')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$values" />
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>
