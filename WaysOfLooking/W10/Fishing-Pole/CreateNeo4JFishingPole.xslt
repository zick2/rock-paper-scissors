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
                        <xsl:text>CreateNeo4JGraph.cypher</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve">
MATCH (n) DETACH DELETE (n);

<xsl:call-template name="rock-paper-scissors" />
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>


    <xsl:template name="rock-paper-scissors">
        <xsl:apply-templates select="rules/shapes" />
        <xsl:apply-templates select="rules/shapes" mode="wins_against" />
    </xsl:template>

    <xsl:template match="/rock-paper-scissors/rules/shapes">
        <xsl:variable name="node-name" select="translate(name, ' ', '')" />
        <xsl:text>CREATE (</xsl:text>
        <xsl:value-of select="concat($node-name, ':Move {name: &quot;', name, '&quot;}')"/>
        <xsl:text>)&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="/rock-paper-scissors/rules/shapes" mode="wins_against">
        <xsl:variable name="node-name" select="translate(name, ' ', '')" />
        <xsl:variable name="wins-against-node-name" select="//shapes[opp_code=current()/wins_against]/name" />
        <xsl:text>CREATE (</xsl:text>
        <xsl:value-of select="concat($node-name, ')-[:BEATS]->(', $wins-against-node-name, ')')"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>




</xsl:stylesheet>


