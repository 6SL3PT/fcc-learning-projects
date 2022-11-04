#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=guessing_game --tuples-only -c"

echo -e "\nEnter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  if [[ $INSERT_USER_RESULT == "INSERT 0 1" ]]
  then
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  fi
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(attempt) FROM games WHERE user_id=$USER_ID")
  echo -e "\nWelcome back, $USERNAME! You have played $(echo $GAMES_PLAYED | sed -r 's/^ *| *$//g') games, and your best game took $(echo $BEST_GAME | sed -r 's/^ *| *$//g') guesses."
fi

ATTEMPT=0
SECRET_NUMBER=$((1 + $RANDOM % 1000))
echo -e "\nGuess the secret number between 1 and 1000:"
GUESS_CORRECT=0

while [[ $GUESS_CORRECT = 0 ]]
do
  ATTEMPT=$(($ATTEMPT + 1))
  read GUESS
  
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $ATTEMPT tries. The secret number was $SECRET_NUMBER. Nice job!"
    GUESS_CORRECT=1
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(attempt, user_id) VALUES($ATTEMPT, $USER_ID)")
  fi
done
