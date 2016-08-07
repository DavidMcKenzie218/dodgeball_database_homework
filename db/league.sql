DROP TABLE matches;
DROP TABLE teams;

CREATE TABLE teams(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE matches(
id SERIAL8 PRIMARY KEY,
home_team_id INT4 references teams(id) ON DELETE CASCADE,
away_team_id INT4 references teams(id) ON DELETE CASCADE,
home_team_score INT4,
away_team_score INT4
);

