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

    <xsl:variable name="shapes1">
        <xsl:for-each select="/*/*">
            <xsl:variable name="index" select="substring-after(name(*), 's')" />
            <xsl:if test="$index!= ''">                
                <xsl:if test="translate($index, '0123456789','')=''">
                    <xsl:variable name="name" select="./*/text()" />
                    <xsl:variable name="s1points" select="//max_pt div //initial_divider" />
                    <xsl:variable name="alternate"                    >
                        <xsl:choose>
                            <xsl:when test="normalize-space(//alternate)='true'">-1</xsl:when>
                            <xsl:otherwise>1</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="increment" select="//increment" />
                <shapes>
                    <name>
                        <xsl:value-of select="$name"/>
                    </name>
                    <index>
                        <xsl:value-of select="$index"/>
                    </index>
                    <max_pt>
                        <xsl:value-of select="//max_pt"/>
                    </max_pt>
                    <initial_divider>
                        <xsl:value-of select="//initial_divider"/>
                    </initial_divider>
                    <s1points>
                        <xsl:value-of select="$s1points"/>
                    </s1points>
                    <opp_code>
                        <xsl:value-of select="translate(substring($name, 1, 1), $ucletters, $lcletters)" />
                    </opp_code>
                    <player_code>
                        <xsl:value-of select="substring($name, 1, 1)" />
                    </player_code>
                    <points>
                        <xsl:value-of select="$s1points + (($index - 1) * $increment * $alternate)" />
                    </points>
                </shapes>
                </xsl:if>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="shapes" select="msxsl:node-set($shapes1)/shapes" />

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
                <xsl:for-each select="$shapes">
                    <xsl:value-of select="name" />
                    <xsl:if test="position() &lt; last()">, </xsl:if>
                </xsl:for-each>
            </name>
            <rules>
                <xsl:for-each select="$shapes">
                    <xsl:variable name="index" select="position()" />
                    <shapes>
                        <name>
                            <xsl:value-of select="name"/>
                        </name>
                        <opp_code>
                            <xsl:value-of select="opp_code"/>
                        </opp_code>
                        <player_code>
                            <xsl:value-of select="player_code"/>
                        </player_code>
                        <wins_against>
                            <xsl:variable name="shape-position" select="position()" />
                            <xsl:choose>
                                <xsl:when test="position() = 1">
                                    <xsl:value-of select="$shapes[position() = count($shapes)]/opp_code"/>
                                </xsl:when>
                            <xsl:otherwise>
                                    <xsl:value-of select="$shapes[position() = $shape-position - 1]/opp_code"/>
                            </xsl:otherwise>
                            </xsl:choose>
                        </wins_against>
                        <score>
                            <xsl:value-of select="points"/>
                        </score>
                    </shapes>                    
                </xsl:for-each>
                <xsl:for-each select="$shapes">
                    <xsl:sort select="points" data-type="number" order="descending"/>
                    <xsl:if test="position() = 1">
                        <outcomes>
                            <win>
                                <xsl:value-of select="//max_pt - points"/>
                            </win>
                            <loss>0</loss>
                            <draw>
                                <xsl:value-of select="(//max_pt - points) div 2"/>
                            </draw>
                        </outcomes>
                    </xsl:if>                    
                </xsl:for-each>
            </rules>
            <!--<raw>
                <xsl:copy-of select="$shapes1"/>
            </raw>-->
        </rock-paper-scissors>
    </xsl:template>
</xsl:stylesheet>
