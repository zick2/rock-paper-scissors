<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>../../../README-02-Spanish.md</RelativePath>
                    <xsl:element name="FileContents" xml:space="default">
                        <xsl:text># </xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text>
Los Elfos comienzan a establecer su campamento en la playa. Para decidir cuál tienda estará más cerca del almacenamiento de aperitivos, un torneo gigante </xsl:text>
                        <xsl:value-of select="/name"/>
                        <xsl:text xml:space="preserve"> ya está en marcha.

</xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text> es un juego entre dos jugadores. Cada juego contiene muchas rondas; en cada ronda, los jugadores eligen simultáneamente uno de </xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1"><xsl:text>,</xsl:text></xsl:if>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="name"/>
                        </xsl:for-each>
                        <xsl:text>&#32; usando una forma de mano. Luego, se selecciona un ganador para esa ronda:</xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1"><xsl:text>,</xsl:text></xsl:if>
                            <xsl:value-of select="name"/>
                            <xsl:text>&#32; gana contra </xsl:text>
                            <xsl:value-of select="//shapes[opp_code=current()/wins_against]/name"/>
                        </xsl:for-each>
                        <xsl:text>. Si ambos jugadores eligen la misma forma, la ronda termina en un empate. </xsl:text>
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
## Formas y Resultados

Hay </xsl:text>
        <xsl:value-of select="count(shapes)"/>
        <xsl:text> formas. Son:
</xsl:text>

        <xsl:apply-templates select="shapes"/>
        <xsl:apply-templates select="outcomes"/>
        <xsl:text>&#32;## Las Reglas 

Agradecido por su ayuda ayer, un Elfo le da una guía de estrategia encriptada (su entrada de puzzle) que dicen que lo ayudará a ganar. "La primera columna es lo que su oponente va a jugar:</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text> </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text> para </xsl:text>
            <xsl:value-of select="name"/>
        </xsl:for-each>
        <xsl:text> y la segunda columna es lo que debes jugar en respuesta:</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:text> </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text> para </xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>,</xsl:text>
        </xsl:for-each>
        <xsl:text> Ganar siempre sería sospechoso, por lo que las respuestas deben haber sido cuidadosamente elegidas.

El ganador de todo el torneo es el jugador con la puntuación más alta. Tu puntuación total es la suma de tus puntuaciones por cada ronda. La puntuación de una sola ronda es la puntuación de la forma que seleccionó (</xsl:text>
        <xsl:for-each select="shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name"/>
            <xsl:text> = </xsl:text>
            <xsl:value-of select="score"/>
        </xsl:for-each>
        <xsl:text>) más la puntuación del resultado de la ronda (</xsl:text>
        <xsl:for-each select="outcomes/*">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name()"/>
            <xsl:text>&#32;=&#32;</xsl:text>
            <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:text>).
            
Como no puedes estar seguro de si el Elf está tratando de ayudarte o engañarte, debes calcular la puntuación que obtendrías si sigues la guía de estrategia.

</xsl:text>
        <xsl:apply-templates select="games"/>
    </xsl:template>

    <xsl:template match="shapes">
        <xsl:text> - </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text> (código de oponente: `</xsl:text>
        <xsl:value-of select="opp_code"/>
        <xsl:text>`, código de jugador: `</xsl:text>
        <xsl:value-of select="player_code"/>
        <xsl:text>`, gana contra: `</xsl:text>
        <xsl:value-of select="//shapes[opp_code = current()/wins_against]/name"/>
        <xsl:text>`, puntuación: </xsl:text>
        <xsl:value-of select="score"/>
        <xsl:text>), </xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="outcomes">
        <xsl:text>
## Las puntuaciones de resultados son: </xsl:text>
        <xsl:text>
- Ganar: </xsl:text>
        <xsl:value-of select="win"/>
        <xsl:text>
- Perder: </xsl:text>
        <xsl:value-of select="loss"/>
        <xsl:text>
- Empate: </xsl:text>
        <xsl:value-of select="draw"/>
        <xsl:text xml:space="preserve">
</xsl:text>
    </xsl:template>

    <xsl:template match="games">
        <xsl:text>&#10;### </xsl:text>
        <xsl:value-of select="nombre"/>
        <xsl:text>

Como no puedes estar seguro si el Elf está tratando de ayudarte o engañarte, debes calcular la puntuación que obtendrías si sigues la guía de estrategia.

Por ejemplo, supongamos que se te ha dado la siguiente guía de estrategia:

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
        <xsl:text>Esta guía de estrategia predice y recomienda lo siguiente:

</xsl:text>
        <xsl:for-each select="rounds">
            <xsl:text>- El oponente eligió </xsl:text>
            <xsl:value-of select="//shapes[opp_code=current()/opp_code]/nombre"/>
            <xsl:text> (código </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text>), el jugador eligió </xsl:text>
            <xsl:value-of select="//shapes[player_code=current()/player_code]/nombre"/>
            <xsl:text> (código </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>)</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>la ronda fue un </xsl:text>
            <xsl:value-of select="resultado"/>
            <xsl:text>, con una puntuación de </xsl:text>
            <xsl:value-of select="puntuación"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>      puntuación de elección: </xsl:text>
            <xsl:value-of select="puntuación_elección"/>
            <xsl:text>, puntuación de resultado: </xsl:text>
            <xsl:value-of select="puntuación_resultado"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>La puntuación final es: </xsl:text>
        <xsl:value-of select="sum(//games/rounds/score)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>


</xsl:stylesheet>