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

    <xsl:template match="@* | node()" mode="add-game-score-if-missing">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="add-game-score-if-missing"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="games" mode="add-scores">
        <games>
            <name>
                <xsl:value-of select="name"/>
            </name>
            <xsl:apply-templates select="*[name() != 'name']" />
        </games>
    </xsl:template>

    <xsl:template match="games" mode="add-game-score-if-missing">
        <games>
            <name>
                <xsl:value-of select="name"/>
            </name>
            <score>
                <xsl:value-of select="sum(//rounds/score)"/>
            </score>
            <xsl:apply-templates select="*[name() != 'name' and name() != 'score']" />
        </games>
    </xsl:template>

    <xsl:variable name="pre1">
        <xsl:apply-templates select="$output-xml" mode="add-scores" />
    </xsl:variable>
    <xsl:variable name="pre" select="msxsl:node-set($pre1)" />
    <xsl:variable name="final">
        <xsl:apply-templates select="$pre" mode="add-game-score-if-missing" />
    </xsl:variable>

    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>../rps.xml</RelativePath>
                    <FileContents>
                        <xsl:copy-of select="$final" />
                    </FileContents>
                    <OverwriteMode>Always</OverwriteMode>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>

    </xsl:template>
    
    <xsl:template match="/" mode="compute-scores">
    <rock-paper-scissors>
        <name>
            <xsl:value-of select="//rules/../name"/>
        </name>        
        <rules>
            <xsl:copy-of select="//rules/shapes"/>
            <xsl:copy-of select="//rules/outcomes"/>
            <xsl:choose>
                <xsl:when test="count(//rules/games/*) = 0">
                    <xsl:variable name="wins" select="//rules/shapes[wins_against=//rules/shapes[(position() mod 3) = 1]/opp_code]/score" />
                    <xsl:variable name="loss" select="//rules/shapes[opp_code=//rules/shapes[(position() mod 3) = 2]/wins_against]/score" />
                    <xsl:variable name="draw" select="//rules/shapes[(position() mod 0) = 0]/score" />
                    <games>
                        <name>Example Game</name>
                        <score>
                            <xsl:value-of select="sum($wins) + (count($wins) * //rules/outcomes/win) +
                                                  sum($loss) + (count($loss) * //rules/outcomes/loss) +
                                                  sum($draw) + (count($draw) * //rules/outcomes/draw)"/>
                        </score>
                        <xsl:for-each select="//rules/shapes">
                            <xsl:variable select="." name="shape"/>
                            <rounds>
                                <player_code>
                                    <xsl:choose>
                                        <xsl:when test="position() mod 3 = 1">
                                            <xsl:value-of select="//rules/shapes[wins_against=current()/opp_code]/player_code"/>
                                        </xsl:when>
                                        <xsl:when test="position() mod 3 = 2">
                                            <xsl:value-of select="//rules/shapes[opp_code=current()/wins_against]/player_code"/>
                                        </xsl:when>
                                        <xsl:when test="position() mod 3 = 0">
                                            <xsl:value-of select="//rules/shapes[opp_code=current()/opp_code]/player_code"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </player_code>
                                <opp_code>
                                    <xsl:value-of select="opp_code"/>
                                </opp_code>
                                <choice_score>
                                    <xsl:value-of select="score"/>
                                </choice_score>
                                <outcome_score>
                                    <xsl:choose>
                                        <xsl:when test="position() mod 3 = 1">
                                            <xsl:value-of select="//rules/outcomes/win"/>
                                        </xsl:when>
                                        <xsl:when test="position() mod 3 = 2">
                                            <xsl:value-of select="//rules/outcomes/loss"/>
                                        </xsl:when>
                                        <xsl:when test="position() mod 3 = 0">
                                            <xsl:value-of select="//rules/outcomes/draw"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </outcome_score>
                            </rounds>
                        </xsl:for-each>
                    </games>
                </xsl:when>
            <xsl:otherwise>
                <games>
                    <xsl:apply-templates select="//rules/games/*"/>
                </games>
            </xsl:otherwise>
            </xsl:choose>
        </rules>
    </rock-paper-scissors>
    </xsl:template>
     <xsl:template match="//rules/games/rounds">
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