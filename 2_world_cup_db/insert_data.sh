#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "CREATE TABLE temp_table(
  year INT,
  round VARCHAR(20),
  winner VARCHAR(50), --this will be our UNIQUE 'name' col. in teams table!
  opponent VARCHAR(50),
  winner_goals INT,
  opponent_goals INT
);"

# $($PSQL "\copy temp_table FROM 'games.csv' WITH (FORMAT csv, HEADER true)")
$PSQL "\copy temp_table FROM 'games.csv' DELIMITER ',' CSV HEADER"

$PSQL "CREATE TABLE teams(
  team_id SERIAL,
  name VARCHAR(50) UNIQUE NOT NULL,
  PRIMARY KEY(team_id)
);"

$PSQL "CREATE TABLE games(
  game_id SERIAL,
  year INT NOT NULL,
  round VARCHAR(20) NOT NULL,
  winner_id INT NOT NULL,
  opponent_id INT NOT NULL,
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL,
  PRIMARY KEY(game_id),
  FOREIGN KEY(winner_id) REFERENCES teams(team_id),
  FOREIGN KEY(opponent_id) REFERENCES teams(team_id)
);"

$PSQL "INSERT INTO teams (name)
SELECT winner FROM temp_table
UNION
SELECT opponent FROM temp_table;"

$PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
SELECT t.year, t.round, w.team_id, o.team_id, t.winner_goals, t.opponent_goals
FROM temp_table t
JOIN teams w ON t.winner = w.name
JOIN teams o ON t.opponent = o.name;"

$PSQL "DROP TABLE temp_table;"