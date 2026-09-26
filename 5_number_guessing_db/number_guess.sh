#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -q -c"

echo "Enter your username:"
read USERNAME

USER_INFO=$($PSQL "SELECT name, games_played, best_game FROM users WHERE name = '$USERNAME';")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(name, games_played, best_game) VALUES ('$USERNAME', 0, 0);"
else
  IFS='|' read DB_USERNAME GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  USERNAME=$DB_USERNAME
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$((RANDOM % 1000 + 1))
GUESS_COUNT=0

echo "Guess the secret number between 1 and 1000:"
read GUESS

while true
do
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
    continue
  fi

  ((GUESS_COUNT++))

  if [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

    $PSQL "UPDATE users
    SET games_played = games_played + 1,
        best_game = CASE
          WHEN best_game = 0 OR $GUESS_COUNT < best_game THEN $GUESS_COUNT
          ELSE best_game
        END
    WHERE name = '$USERNAME';"

    break
  fi

  read GUESS
done