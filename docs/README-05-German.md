# Rock, Paper, Scissors
Die Elfen beginnen ihr Lager am Strand aufzubauen. Um zu entscheiden, welches Zelt näher am Snack-Lager sein wird, findet bereits ein riesiges 
-Turnier statt.

Rock, Paper, Scissors ist ein Spiel zwischen zwei Spielern. Jedes Spiel besteht aus vielen Runden; in jeder Runde wählen die Spieler gleichzeitig eine von 
Rock,Paper,Scissors  Formen mit einer Handform. Dann wird ein Gewinner für diese Runde ausgewählt: 
Rock  gewinnt gegen Scissors,Paper  gewinnt gegen Rock,Scissors  gewinnt gegen Paper. Wenn beide Spieler dieselbe Form wählen, endet die Runde unentschieden. 
## Formen und Ergebnisse

Es gibt 3 Formen. Dies sind:
 - Rock (Gegnercode: `A`, Spielercode: `X`, gewinnt gegen: `Scissors`, Punktzahl: 1), 
 - Paper (Gegnercode: `B`, Spielercode: `Y`, gewinnt gegen: `Rock`, Punktzahl: 2), 
 - Scissors (Gegnercode: `C`, Spielercode: `Z`, gewinnt gegen: `Paper`, Punktzahl: 3), 

## Die Ergebnisbewertungen sind: 
- Gewinnen: 6
- Verlieren: 0
- Unentschieden: 3
 ## Die Regeln 

Als Dank für Ihre Hilfe gestern gibt Ihnen ein Elf eine verschlüsselte Strategieanleitung (sein Puzzle-Eingabedatum), die sagt, dass es Ihnen helfen wird, zu gewinnen. "Die erste Spalte ist das, was Ihr Gegner spielen wird:A für Rock,B für Paper,C für Scissors und die zweite Spalte ist das, was Sie in Antwort spielen sollen:X für Rock,Y für Paper,Z für Scissors, Immer zu gewinnen wäre verdächtig, deshalb müssen die Antworten sorgfältig ausgewählt worden sein.

Der Sieger des gesamten Turniers ist der Spieler mit der höchsten Punktzahl. Ihre Gesamtpunktzahl ist die Summe Ihrer Punktzahlen pro Runde. Die Punktzahl einer einzigen Runde ist die Punktzahl der gewählten Form (Rock = 1,Paper = 2,Scissors = 3Immer zu gewinnen wäre verdächtig, daher müssen die Antworten sorgfältig ausgewählt worden sein.

Der Gesamtsieger des Turniers ist der Spieler mit der höchsten Punktzahl. Deine Gesamtpunktzahl ist die Summe deiner Punkte für jede Runde. Die Punktzahl für eine einzige Runde ist die Punktzahl der ausgewählten Form (Rock = 1,Paper = 2,Scissors = 3) plus die Punktzahl des Rundenergebnisses (win = 6,loss = 0,draw = 3).

Da man nicht sicher sein kann, ob der Elf versucht, dir zu helfen oder dich zu täuschen, musst du die Punktzahl berechnen, die du erzielen würdest, wenn du der Strategieanleitung folgst.


### Example Game
Da Sie nicht sicher sein können, ob der Elf versucht, Ihnen zu helfen oder Sie zu täuschen, müssen Sie die Bewertung berechnen, die Sie erhalten würden, wenn Sie dem Strategieleitfaden folgen.

Zum Beispiel nehmen wir an, dass Ihnen der folgende Strategieleitfaden gegeben wurde:

```
A Y
B X
C Z
```
Dieser Strategieleitfaden prognostiziert und empfiehlt Folgendes:

- Der Gegner wählte Rock (Code A), der Spieler wählte Paper (Code Y)
Die Runde war ein win, mit einer Punktzahl von 8
      Wahlpunktzahl: 2, Ergebnispunktzahl: 6
- Der Gegner wählte Paper (Code B), der Spieler wählte Rock (Code X)
Die Runde war ein loss, mit einer Punktzahl von 1
      Wahlpunktzahl: 1, Ergebnispunktzahl: 0
- Der Gegner wählte Scissors (Code C), der Spieler wählte Scissors (Code Z)
Die Runde war ein draw, mit einer Punktzahl von 6
      Wahlpunktzahl: 3, Ergebnispunktzahl: 3
Die Endpunktzahl ist: 15
