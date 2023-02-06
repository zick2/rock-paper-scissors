<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>../../../docs/README-04-French.md</RelativePath>
                    <xsl:element name="FileContents" xml:space="default">
                        <xsl:text># </xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text>
Les Elfes commencent à établir leur campement sur la plage. Pour décider quelle tente sera la plus proche du stockage de collations, un tournoi gigantesque </xsl:text>
                        <xsl:value-of select="/name"/>
                        <xsl:text xml:space="preserve"> est déjà en cours.

</xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text> est un jeu entre deux joueurs. Chaque jeu contient de nombreuses rounds; dans chaque tour, les joueurs choisissent simultanément une des </xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1">
                                <xsl:text>,</xsl:text>
                            </xsl:if>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="name"/>
                        </xsl:for-each>
                        <xsl:text>&#32; en utilisant une forme de main. Ensuite, un gagnant est sélectionné pour ce tour:</xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1">
                                <xsl:text>,</xsl:text>
                            </xsl:if>
                            <xsl:value-of select="name"/>
                            <xsl:text>&#32; gagne contre </xsl:text>
                            <xsl:value-of select="//shapes[opp_code=current()/wins_against]/name"/>
                        </xsl:for-each>
                        <xsl:text>. Si les deux joueurs choisissent la même forme, le tour se termine par un match nul. </xsl:text>
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
## Formes et Résultats
Il y a </xsl:text>
        <xsl:value-of select="count(shapes)"/>
        <xsl:text>formes. Ce sont:
</xsl:text>

        <xsl:apply-templates select="shapes"/>
        <xsl:apply-templates select="outcomes"/>
        <xsl:text>&#32;## Les Règles 
Reconnaissant votre aide hier, un elfe vous donne une stratégie de jeu cryptée (votre entrée de puzzle) qui dit qu'elle vous aidera à gagner. "La première colonne est ce que votre adversaire va jouer:</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text> </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text> pour </xsl:text>
            <xsl:value-of select="name"/>
        </xsl:for-each>
        <xsl:text> et la seconde colonne est ce que vous devez jouer en réponse:</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:text> </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text> pour </xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>,</xsl:text>
        </xsl:for-each>
        <xsl:text>  Gagner toujours serait suspect, donc les réponses doivent avoir été soigneusement choisies.

Le gagnant de tout le tournoi est le joueur avec le score le plus élevé. Votre score total est la somme de vos scores pour chaque tour. Le score d'un seul tour est le score de la forme qu'il a choisi (</xsl:text>
        <xsl:for-each select="shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name"/>
            <xsl:text> = </xsl:text>
            <xsl:value-of select="score"/>
        </xsl:for-each>
        <xsl:text>) plus le score du résultat du tour (</xsl:text>
        <xsl:for-each select="outcomes/*">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name()"/>
            <xsl:text>&#32;=&#32;</xsl:text>
            <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:text>).
            
Comme vous ne pouvez pas être sûr que l'Elfe essaie de vous aider ou de vous tromper, vous devez calculer le score que vous obtiendriez en suivant la stratégie de guide.

</xsl:text>
        <xsl:apply-templates select="games"/>
    </xsl:template>

    <xsl:template match="shapes">
        <xsl:text> - </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>  (code adversaire: `</xsl:text>
        <xsl:value-of select="opp_code"/>
        <xsl:text>`, code joueur: `</xsl:text>
        <xsl:value-of select="player_code"/>
        <xsl:text>`, gagne contre: `</xsl:text>
        <xsl:value-of select="//shapes[opp_code = current()/wins_against]/name"/>
        <xsl:text>`, score: </xsl:text>
        <xsl:value-of select="score"/>
        <xsl:text>), </xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="outcomes">
        <xsl:text>
## Les scores de résultats sont: </xsl:text>
        <xsl:text>
- Gagner: </xsl:text>
        <xsl:value-of select="win"/>
        <xsl:text>
- Perdre: </xsl:text>
        <xsl:value-of select="loss"/>
        <xsl:text>
- Match nul: </xsl:text>
        <xsl:value-of select="draw"/>
        <xsl:text xml:space="preserve">
</xsl:text>
    </xsl:template>

    <xsl:template match="games">
        <xsl:text>&#10;### </xsl:text>
        <xsl:value-of select="nombre"/>
        <xsl:text>

Comme vous ne pouvez pas être sûr si l'Elf essaye de vous aider ou de vous tromper, vous devez calculer le score que vous obtiendriez en suivant la stratégie.

Par exemple, supposons que vous ayez été donné la stratégie suivante:

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
        <xsl:text>Cette stratégie de guide prédit et recommande ce qui suit:

</xsl:text>
        <xsl:for-each select="rounds">
            <xsl:text>- L'adversaire a choisi </xsl:text>
            <xsl:value-of select="//shapes[opp_code=current()/opp_code]/name"/>
            <xsl:text> (code </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text>), le joueur a choisi </xsl:text>
            <xsl:value-of select="//shapes[player_code=current()/player_code]/name"/>
            <xsl:text> (code </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>)</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>le tour était un </xsl:text>
            <xsl:value-of select="result"/>
            <xsl:text>, avec un score de </xsl:text>
            <xsl:value-of select="score"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>     score de choix: </xsl:text>
            <xsl:value-of select="choice_score"/>
            <xsl:text>,  score de résultat:</xsl:text>
            <xsl:value-of select="outcome_score"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>Le score final est: </xsl:text>
        <xsl:value-of select="sum(//games/rounds/score)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>


</xsl:stylesheet>