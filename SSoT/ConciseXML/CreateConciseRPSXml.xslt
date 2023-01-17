<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" encoding="UTF-8" media-type="text/xml" />
    <xsl:variable name="output-xml1">
        <xsl:apply-templates select="/" mode="compute-scores" />
    </xsl:variable>
    <xsl:variable name="output-xml" select="msxsl:node-set($output-xml1)" />
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@* | node()" mode="add-scores">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="add-scores"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="games" mode="add-scores">
        <games>
            <name>
                <xsl:value-of select="name"/>
            </name>
            <score>
                <xsl:value-of select="sum(rounds/score)"/>
            </score>
            <xsl:apply-templates select="*[name() != 'name']" />
        </games>
    </xsl:template>

    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>../rps.xml</RelativePath>
                    <FileContents>
                        <xsl:apply-templates select="$output-xml" mode="add-scores" />                        
                    </FileContents>
                    <OverwriteMode>Always</OverwriteMode>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>

    </xsl:template>
    
    <xsl:template match="/" mode="compute-scores">
    <rock-paper-scissors>
        <name>
            <xsl:value-of select="/*/name"/>
        </name>
        <rules>
            <xsl:copy-of select="/*/rules/shapes"/>
            <xsl:copy-of select="/*/rules/outcomes"/>
            <games>
                <name>
                    <xsl:value-of select="/*/rules/games/name"/>
                </name>
                <xsl:apply-templates select="/*/rules/games/rounds"/>
            </games>
        </rules>
    </rock-paper-scissors>
    </xsl:template>
     <xsl:template match="/*/rules/games/rounds">
         <xsl:variable name="player" select="//shapes[player_code = current()/player_code]" />
         <xsl:variable name="opp" select="//shapes[opp_code = current()/opp_code]" />
         <xsl:variable name="result">
             <xsl:choose>
                 <xsl:when test="opp_code = $player/wins_against">win</xsl:when>
                 <xsl:when test="$player/opp_code = $opp/wins_against">loss</xsl:when>
                 <xsl:otherwise>draw</xsl:otherwise>
             </xsl:choose>
         </xsl:variable>
         <rounds>
             <xsl:copy-of select="player_code"/>
             <xsl:copy-of select="opp_code"/>
         <result>
             <xsl:value-of select="$result"/>
        </result>
        <score>
            <xsl:variable name="choice_score" select="//shapes[player_code = current()/player_code]/score"/>
            <xsl:variable name="outcome_score">
                <xsl:choose>
                    <xsl:when test="$result='win'">
                        <xsl:value-of select="//outcomes/win"/>
                    </xsl:when>
                    <xsl:when test="$result='loss'">
                        <xsl:value-of select="//outcomes/loss"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="//outcomes/draw"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:value-of select="$choice_score + $outcome_score"/>
        </score>
        <choice_score>
        <xsl:value-of select="//shapes[player_code = current()/player_code]/score"/>
      </choice_score>
      <outcome_score>
        <xsl:choose>
          <xsl:when test="$result='win'">
            <xsl:value-of select="//outcomes/win"/>
          </xsl:when>
          <xsl:when test="$result='loss'">
            <xsl:value-of select="//outcomes/loss"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="//outcomes/draw"/>
          </xsl:otherwise>
        </xsl:choose>
      </outcome_score>
    </rounds>
  </xsl:template>
</xsl:stylesheet>