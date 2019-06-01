#!/bin/bash

RANDOMICO=$1
DB=$2

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat pt-en.txt))'

TOTAL=${#XYZ[@]}

if [ "$RANDOMICO" = "R"  ]
then
  CONTADOR=`shuf -i 0-1000 -n 1`
else
  CONTADOR=0
fi

while :; do

  phrase_in_portuguese="$(cut -d';' -f1 <<<${XYZ[$CONTADOR]})"
  phrase_in_english="$(cut -d';' -f2 <<<${XYZ[$CONTADOR]})"

  printf "Palavra $CONTADOR: '$phrase_in_portuguese' " 

  read input_phrase_in_english

  if [ "${phrase_in_english^^}" = "${input_phrase_in_english^^}" ]; 
  then
    printf "${GREEN}Correto${NC}\n"
  else
    printf "${RED}Errado${NC} A tradução correta é '$phrase_in_english'\n"
  fi

  if [ "$RANDOMICO" = "R"  ]
  then
    let CONTADOR=`shuf -i 0-1000 -n 1`
  else
    let CONTADOR=CONTADOR+1; 
  fi

done
