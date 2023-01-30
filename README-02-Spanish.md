# Rock, Paper, Scissors
Los Elfos comienzan a establecer su campamento en la playa. Para decidir cuál tienda estará más cerca del almacenamiento de aperitivos, un torneo gigante  ya está en marcha.

Rock, Paper, Scissors es un juego entre dos jugadores. Cada juego contiene muchas rondas; en cada ronda, los jugadores eligen simultáneamente uno de Rock,Paper,Scissors  usando una forma de mano. Luego, se selecciona un ganador para esa ronda:Rock  gana contra Scissors,Paper  gana contra Rock,Scissors  gana contra Paper. Si ambos jugadores eligen la misma forma, la ronda termina en un empate. 
## Formas y Resultados

Hay 3 formas. Son:
 - Rock (código de oponente: `A`, código de jugador: `X`, gana contra: `Scissors`, puntuación: 1), 
 - Paper (código de oponente: `B`, código de jugador: `Y`, gana contra: `Rock`, puntuación: 2), 
 - Scissors (código de oponente: `C`, código de jugador: `Z`, gana contra: `Paper`, puntuación: 3), 

## Las puntuaciones de resultados son: 
- Ganar: 6
- Perder: 0
- Empate: 3
 ## Las Reglas 

Agradecido por su ayuda ayer, un Elfo le da una guía de estrategia encriptada (su entrada de puzzle) que dicen que lo ayudará a ganar. "La primera columna es lo que su oponente va a jugar:A para Rock,B para Paper,C para Scissors y la segunda columna es lo que debes jugar en respuesta:X para Rock,Y para Paper,Z para Scissors, Ganar siempre sería sospechoso, por lo que las respuestas deben haber sido cuidadosamente elegidas.

El ganador de todo el torneo es el jugador con la puntuación más alta. Tu puntuación total es la suma de tus puntuaciones por cada ronda. La puntuación de una sola ronda es la puntuación de la forma que seleccionó (Rock = 1,Paper = 2,Scissors = 3) más la puntuación del resultado de la ronda (win = 6,loss = 0,draw = 3).
            
Como no puedes estar seguro de si el Elf está tratando de ayudarte o engañarte, debes calcular la puntuación que obtendrías si sigues la guía de estrategia.


### 

Como no puedes estar seguro si el Elf está tratando de ayudarte o engañarte, debes calcular la puntuación que obtendrías si sigues la guía de estrategia.

Por ejemplo, supongamos que se te ha dado la siguiente guía de estrategia:

```
A Y
B X
C Z
```
Esta guía de estrategia predice y recomienda lo siguiente:

- El oponente eligió  (código A), el jugador eligió  (código Y)
la ronda fue un , con una puntuación de 
      puntuación de elección: , puntuación de resultado: 
- El oponente eligió  (código B), el jugador eligió  (código X)
la ronda fue un , con una puntuación de 
      puntuación de elección: , puntuación de resultado: 
- El oponente eligió  (código C), el jugador eligió  (código Z)
la ronda fue un , con una puntuación de 
      puntuación de elección: , puntuación de resultado: 
La puntuación final es: 15
