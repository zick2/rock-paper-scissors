<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>../../../docs/README-05-German.md</RelativePath>
                    <xsl:element name="FileContents" xml:space="default">
                        <xsl:text># </xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text>
Die Elfen beginnen ihr Lager am Strand aufzubauen. Um zu entscheiden, welches Zelt näher am Snack-Lager sein wird, findet bereits ein riesiges 
</xsl:text>
                        <xsl:value-of select="/name"/>
                        <xsl:text xml:space="preserve">-Turnier statt.

</xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text> ist ein Spiel zwischen zwei Spielern. Jedes Spiel besteht aus vielen Runden; in jeder Runde wählen die Spieler gleichzeitig eine von 
</xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1">
                                <xsl:text>,</xsl:text>
                            </xsl:if>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="name"/>
                        </xsl:for-each>
                        <xsl:text>&#32; Formen mit einer Handform. Dann wird ein Gewinner für diese Runde ausgewählt: 
</xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1">
                                <xsl:text>,</xsl:text>
                            </xsl:if>
                            <xsl:value-of select="name"/>
                            <xsl:text>&#32; gewinnt gegen </xsl:text>
                            <xsl:value-of select="//shapes[opp_code=current()/wins_against]/name"/>
                        </xsl:for-each>
                        <xsl:text>. Wenn beide Spieler dieselbe Form wählen, endet die Runde unentschieden. </xsl:text>
                        <xsl:apply-templates select="*/rules"/>
                    </xsl:element>
                    <OverwriteMode>Always</OverwriteMode>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>


    <xsl:template match="rules">
        <xsl:text>
</xsl:text>
        <xsl:text>
## Formen und Ergebnisse

Es gibt </xsl:text>
        <xsl:value-of select="count(shapes)"/>
        <xsl:text> Formen. Dies sind:
</xsl:text>

        <xsl:apply-templates select="shapes"/>
        <xsl:apply-templates select="outcomes"/>
        <xsl:text>&#32;## Die Regeln 

Als Dank für Ihre Hilfe gestern gibt Ihnen ein Elf eine verschlüsselte Strategieanleitung (sein Puzzle-Eingabedatum), die sagt, dass es Ihnen helfen wird, zu gewinnen. "Die erste Spalte ist das, was Ihr Gegner spielen wird:</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text> </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text> für </xsl:text>
            <xsl:value-of select="name"/>
        </xsl:for-each>
        <xsl:text> und die zweite Spalte ist das, was Sie in Antwort spielen sollen:</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:text> </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text> für </xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>,</xsl:text>
        </xsl:for-each>
        <xsl:text> Immer zu gewinnen wäre verdächtig, deshalb müssen die Antworten sorgfältig ausgewählt worden sein.

Der Sieger des gesamten Turniers ist der Spieler mit der höchsten Punktzahl. Ihre Gesamtpunktzahl ist die Summe Ihrer Punktzahlen pro Runde. Die Punktzahl einer einzigen Runde ist die Punktzahl der gewählten Form (</xsl:text>
        <xsl:for-each select="shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name"/>
            <xsl:text> = </xsl:text>
            <xsl:value-of select="score"/>
        </xsl:for-each>
        <xsl:text>) plus die Punktzahl des Rundenergebnisses (</xsl:text>
        <xsl:for-each select="outcomes/*">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name()"/>
            <xsl:text>&#32;=&#32;</xsl:text>
            <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:text>).

Da man nicht sicher sein kann, ob der Elf versucht, dir zu helfen oder dich zu täuschen, musst du die Punktzahl berechnen, die du erzielen würdest, wenn du der Strategieanleitung folgst.

</xsl:text>
        <xsl:apply-templates select="games"/>
    </xsl:template>

    <xsl:template match="shapes">
        <xsl:text> - </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text> (Gegnercode: `</xsl:text>
        <xsl:value-of select="opp_code"/>
        <xsl:text>`, Spielercode: `</xsl:text>
        <xsl:value-of select="player_code"/>
        <xsl:text>`, gewinnt gegen: `</xsl:text>
        <xsl:value-of select="//shapes[opp_code = current()/wins_against]/name"/>
        <xsl:text>`, Punktzahl: </xsl:text>
        <xsl:value-of select="score"/>
        <xsl:text>), </xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>


    <xsl:template match="outcomes">
        <xsl:text>
## Die Ergebnisbewertungen sind: </xsl:text>
        <xsl:text>
- Gewinnen: </xsl:text>
        <xsl:value-of select="win"/>
        <xsl:text>
- Verlieren: </xsl:text>
        <xsl:value-of select="loss"/>
        <xsl:text>
- Unentschieden: </xsl:text>
        <xsl:value-of select="draw"/>
        <xsl:text xml:space="preserve">
</xsl:text>
    </xsl:template>

    <xsl:template match="games">
        <xsl:text>&#10;### </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>
Da Sie nicht sicher sein können, ob der Elf versucht, Ihnen zu helfen oder Sie zu täuschen, müssen Sie die Bewertung berechnen, die Sie erhalten würden, wenn Sie dem Strategieleitfaden folgen.

Zum Beispiel nehmen wir an, dass Ihnen der folgende Strategieleitfaden gegeben wurde:

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
<xsl:text>Dieser Strategieleitfaden prognostiziert und empfiehlt Folgendes:

</xsl:text>
        <xsl:for-each select="rounds">
            <xsl:text>- Der Gegner wählte </xsl:text>
            <xsl:value-of select="//shapes[opp_code=current()/opp_code]/name"/>
            <xsl:text> (Code </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text>), der Spieler wählte </xsl:text>
            <xsl:value-of select="//shapes[player_code=current()/player_code]/name"/>
            <xsl:text> (Code </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>)</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Die Runde war ein </xsl:text>
            <xsl:value-of select="result"/>
            <xsl:text>, mit einer Punktzahl von </xsl:text>
            <xsl:value-of select="score"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>      Wahlpunktzahl: </xsl:text>
            <xsl:value-of select="choice_score"/>
            <xsl:text>, Ergebnispunktzahl: </xsl:text>
            <xsl:value-of select="outcome_score"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>Die Endpunktzahl ist: </xsl:text>
        <xsl:value-of select="sum(//games/rounds/score)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>