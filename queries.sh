#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) as total_goals FROM games;")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) as avarage from games;")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),2) as avarage from games;")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals+opponent_goals) as avarage from games;")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) from games;")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2;")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select w.name from games g join teams w on g.winner_id = w.team_id join teams o on g.opponent_id = o.team_id WHERE round = 'Final' and year = 2018;")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT distinct(name) from teams where team_id in (select winner_id from games WHERE round = 'Eighth-Final' and year = 2014 UNION select opponent_id from games WHERE round = 'Eighth-Final' and year = 2014);")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "")"
