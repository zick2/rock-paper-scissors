<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <xsl:variable name="data">
        <xsl:text># </xsl:text>
        <xsl:value-of select="*/name"/>
        <xsl:text>
The Elves begin to set up camp on the beach. To decide whose tent gets to be closest to the snack storage, a giant </xsl:text>
        <xsl:value-of select="*/name"/>
        <xsl:text> tournament is already in progress.

</xsl:text>
        <xsl:value-of select="*/name"/>
        <xsl:text> is a game between two players. Each game contains many rounds; in each round, the players each simultaneously choose one of </xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text> </xsl:text>
            <xsl:value-of select="name"/>
        </xsl:for-each>
        <xsl:text>&#32;using a hand shape. Then, a winner for that round is selected :</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name"/>
            <xsl:text>&#32;wins against </xsl:text>
            <xsl:value-of select="//shapes[opp_code=current()/wins_against]/name"/>
        </xsl:for-each>
        <xsl:text>.  If both players choose the same shape, the round instead ends in a draw. </xsl:text>
        <xsl:apply-templates select="*/rules"/>
    </xsl:variable>    
    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>../../README-Fluid-Fish.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-01-English.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-04-French.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-05-German.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-06-Greek.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-07-Russian.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-08-Old-English.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-09-Portugese.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-10-Korean.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-11-Hebrew.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-12-Latin.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>
                <FileSetFile>
                    <RelativePath>../../README-13-Swedish.md</RelativePath>
                    <FileContents><xsl:copy-of select="$data"/></FileContents>
                </FileSetFile>

            </FileSetFiles>
        </FileSet>    </xsl:template>

    <xsl:template match="rules">
        <xsl:text>&#10;</xsl:text>
        <xsl:text>## Shapes and Outcomes

There are </xsl:text>
        <xsl:value-of select="count(shapes)"/>
        <xsl:text>&#32;shapes. They are:
</xsl:text>

        <xsl:apply-templates select="shapes"/>
        <xsl:apply-templates select="outcomes"/>
        <xsl:text>
## The Rules

Appreciative of your help yesterday, one Elf gives you an encrypted strategy guide (your puzzle input) that they say will be sure to help you win. "The first column is what your opponent is going to play:</xsl:text>
  <xsl:for-each select="//shapes">
    <xsl:if test="position() > 1"><xsl:text>,</xsl:text></xsl:if>
    <xsl:text>&#32;</xsl:text>
    <xsl:value-of select="opp_code"/>
    <xsl:text>&#32;for </xsl:text>
    <xsl:value-of select="name"/>
  </xsl:for-each>
  <xsl:text>&#32;and the second column is what you should play in response:</xsl:text>
  <xsl:for-each select="//shapes">
    <xsl:text>&#32;</xsl:text>
    <xsl:value-of select="player_code"/>
    <xsl:text>&#32;for </xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>,</xsl:text>
  </xsl:for-each>
  <xsl:text>&#32;Winning every time would be suspicious, so the responses must have been carefully chosen.
    
The winner of the whole tournament is the player with the highest score. Your total score is the sum of your scores for each round. The score for a single round is the score for the shape you selected (</xsl:text>
              <xsl:for-each select="shapes">
                <xsl:if test="position() > 1"><xsl:text>,</xsl:text></xsl:if>
                <xsl:value-of select="name"/>
                <xsl:text>&#32;=&#32;</xsl:text>
                <xsl:value-of select="score"/>
              </xsl:for-each>
            <xsl:text>) plus the score for the outcome of the round (</xsl:text>
              <xsl:for-each select="outcomes/*">
                  <xsl:if test="position() > 1"><xsl:text>,</xsl:text></xsl:if>
                  <xsl:value-of select="name()"/>
                  <xsl:text>&#32;=&#32;</xsl:text>
                <xsl:value-of select="."/>
              </xsl:for-each>
            <xsl:text>).
            
Since you can't be sure if the Elf is trying to help you or trick you, you should calculate the score you would get if you were to follow the strategy guide.

</xsl:text>
        <xsl:apply-templates select="games"/>
    </xsl:template>

    <xsl:template match="shapes">
        <xsl:text> - </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text> (opp code: `</xsl:text>
        <xsl:value-of select="opp_code"/>
        <xsl:text>`, player code: `</xsl:text>
        <xsl:value-of select="player_code"/>
        <xsl:text>`, wins against: `</xsl:text>
        <xsl:value-of select="//shapes[opp_code = current()/wins_against]/name"/>
        <xsl:text>`, score: </xsl:text>
        <xsl:value-of select="score"/>
        <xsl:text>), </xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="outcomes">
        <xsl:text>&#10;&#10;The outcome scores are: </xsl:text>
        <xsl:text>&#10; - Win: </xsl:text>
        <xsl:value-of select="win"/>
        <xsl:text>&#10; - Loss: </xsl:text>
        <xsl:value-of select="loss"/>
        <xsl:text>&#10; - Draw: </xsl:text>
        <xsl:value-of select="draw"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="games">
    <xsl:text>&#10;### </xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>

Since you can't be sure if the Elf is trying to help you or trick you, you should calculate the score you would get if you were to follow the strategy guide.

For example, suppose you were given the following strategy guide:

</xsl:text>
       <xsl:text>```
</xsl:text>
    <xsl:for-each select="//rounds">
        <xsl:value-of select="opp_code"/>
        <xsl:text>&#32;</xsl:text>
        <xsl:value-of select="player_code"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:for-each>
       <xsl:text>```
</xsl:text>
       <xsl:text>This strategy guide predicts and recommends the following:

</xsl:text>
    <xsl:for-each select="rounds">
        <xsl:text>- Opponent chose </xsl:text>
        <xsl:value-of select="//shapes[opp_code=current()/opp_code]/name"/>
        <xsl:text> (code </xsl:text>
        <xsl:value-of select="opp_code"/>
        <xsl:text>), player chose </xsl:text>
        <xsl:value-of select="//shapes[player_code=current()/player_code]/name"/>
        <xsl:text> (code </xsl:text>
        <xsl:value-of select="player_code"/>
        <xsl:text>)</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>the round was a </xsl:text>
        <xsl:value-of select="result"/>
        <xsl:text>, with a score of </xsl:text>
        <xsl:value-of select="score"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>      choice score: </xsl:text>
        <xsl:value-of select="choice_score"/>
        <xsl:text>, outcome score: </xsl:text>
        <xsl:value-of select="outcome_score"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:for-each>
    <xsl:text>The final score is: </xsl:text>
    <xsl:value-of select="sum(//games/rounds/score)"/>
    <xsl:text>&#10;</xsl:text>
</xsl:template>


</xsl:stylesheet>
