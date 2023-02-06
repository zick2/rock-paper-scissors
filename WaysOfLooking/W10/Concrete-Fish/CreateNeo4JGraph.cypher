CREATE (r:Move {name: "rock"})
CREATE (p:Move {name: "paper"})
CREATE (s:Move {name: "scissors"})

CREATE (r)-[:BEATS]->(s)
CREATE (p)-[:BEATS]->(r)
CREATE (s)-[:BEATS]->(p)