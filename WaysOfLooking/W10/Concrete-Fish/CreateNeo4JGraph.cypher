
MATCH (n) DETACH DELETE (n);

CREATE (Rock:Move {name: "Rock"})
CREATE (Paper:Move {name: "Paper"})
CREATE (Scissors:Move {name: "Scissors"})
CREATE (Rock)-[:BEATS]->(Scissors)
CREATE (Paper)-[:BEATS]->(Rock)
CREATE (Scissors)-[:BEATS]->(Paper)