#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_DETAILS=$($PSQL "SELECT * FROM players WHERE username='$USERNAME';")

if [[ -z $USER_DETAILS ]]
then

  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

else 

  echo $USER_DETAILS | while IFS="|" read USERNAME GAMES_PLAYED BEST_GUESS 
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
  done

fi

NUM_GUESSES=0

RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
echo -e "\nRandom Num: $RANDOM_NUMBER"

echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS

until [[ $RANDOM_NUMBER -eq $USER_GUESS ]]
do

    (( NUM_GUESSES++ ))

    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    fi

    if [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
    fi

    if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
    fi

    read USER_GUESS

done

(( NUM_GUESSES++ ))

echo -e "\nYou guessed it in $NUM_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

if [[ -z $USER_DETAILS ]]
then

  INSERT_USER=$($PSQL "INSERT INTO players VALUES ('$USERNAME', 1, $NUM_GUESSES)")

else

  UPDATE_GAMES=$($PSQL "UPDATE players SET games_played = games_played + 1 WHERE username = '$USERNAME'")

  # Get best guess 

  BEST_GUESS=$($PSQL "SELECT best_guess FROM players WHERE username = '$USERNAME'")

  if [[ $NUM_GUESSES < $BEST_GUESS ]]
  then
    UPDATE_GUESS=$($PSQL "UPDATE players SET best_guess = $NUM_GUESSES WHERE username = '$USERNAME'")
  fi

fi
