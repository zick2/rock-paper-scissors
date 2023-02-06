# Rock, Paper, Scissors
Les Elfes commencent à établir leur campement sur la plage. Pour décider quelle tente sera la plus proche du stockage de collations, un tournoi gigantesque  est déjà en cours.

Rock, Paper, Scissors est un jeu entre deux joueurs. Chaque jeu contient de nombreuses rounds; dans chaque tour, les joueurs choisissent simultanément une des Rock,Paper,Scissors  en utilisant une forme de main. Ensuite, un gagnant est sélectionné pour ce tour:Rock  gagne contre Scissors,Paper  gagne contre Rock,Scissors  gagne contre Paper. Si les deux joueurs choisissent la même forme, le tour se termine par un match nul. 
## Formes et Résultats
Il y a 3formes. Ce sont:
 - Rock  (code adversaire: `A`, code joueur: `X`, gagne contre: `Scissors`, score: 1), 
 - Paper  (code adversaire: `B`, code joueur: `Y`, gagne contre: `Rock`, score: 2), 
 - Scissors  (code adversaire: `C`, code joueur: `Z`, gagne contre: `Paper`, score: 3), 

## Les scores de résultats sont: 
- Gagner: 6
- Perdre: 0
- Match nul: 3
 ## Les Règles 
Reconnaissant votre aide hier, un elfe vous donne une stratégie de jeu cryptée (votre entrée de puzzle) qui dit qu'elle vous aidera à gagner. "La première colonne est ce que votre adversaire va jouer:A pour Rock,B pour Paper,C pour Scissors et la seconde colonne est ce que vous devez jouer en réponse:X pour Rock,Y pour Paper,Z pour Scissors,  Gagner toujours serait suspect, donc les réponses doivent avoir été soigneusement choisies.

Le gagnant de tout le tournoi est le joueur avec le score le plus élevé. Votre score total est la somme de vos scores pour chaque tour. Le score d'un seul tour est le score de la forme qu'il a choisi (Rock = 1,Paper = 2,Scissors = 3) plus le score du résultat du tour (win = 6,loss = 0,draw = 3).
            
Comme vous ne pouvez pas être sûr que l'Elfe essaie de vous aider ou de vous tromper, vous devez calculer le score que vous obtiendriez en suivant la stratégie de guide.


### 

Comme vous ne pouvez pas être sûr si l'Elf essaye de vous aider ou de vous tromper, vous devez calculer le score que vous obtiendriez en suivant la stratégie.

Par exemple, supposons que vous ayez été donné la stratégie suivante:

```
A Y
B X
C Z
```
Cette stratégie de guide prédit et recommande ce qui suit:

- L'adversaire a choisi Rock (code A), le joueur a choisi Paper (code Y)
le tour était un win, avec un score de 8
     score de choix: 2,  score de résultat:6
- L'adversaire a choisi Paper (code B), le joueur a choisi Rock (code X)
le tour était un loss, avec un score de 1
     score de choix: 1,  score de résultat:0
- L'adversaire a choisi Scissors (code C), le joueur a choisi Scissors (code Z)
le tour était un draw, avec un score de 6
     score de choix: 3,  score de résultat:3
Le score final est: 15
