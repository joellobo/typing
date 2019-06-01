#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat db.txt))'

CONTADOR=0
TOTAL=${#XYZ[@]}

while :; do

  phrase_in_portuguese="$(cut -d';' -f1 <<<${XYZ[$CONTADOR]})"
  phrase_in_english="$(cut -d';' -f2 <<<${XYZ[$CONTADOR]})"

  echo "Palavra $CONTADOR: '$phrase_in_portuguese' '$phrase_in_english'" 

  read input_phrase_in_english

  if [ "$phrase_in_english" = "$input_phrase_in_english" ]; 
  then
    echo "Correto"
  else
    printf "${RED}Errado${NC} A tradução correta é '$phrase_in_english'\n"
  fi

  let CONTADOR=CONTADOR+1; 

done