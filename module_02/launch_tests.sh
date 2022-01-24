#!/bin/bash

EXO_PATH="."

GREEN="\e[1;32m"
RED="\e[1;31m"
MAG="\e[1;35m"
BOLD="\e[1m"
NC="\e[0m"

ERROR=0
EX=-1
TEST_NB=0

. ./tests/test_cases.sh

declare -a FUNCTION
FUNCTION[0]="ex00"
FUNCTION[1]="ex01"
# FUNCTION[2]="ex02"
# FUNCTION[3]="ex03"
# FUNCTION[4]="ex04"
# FUNCTION[5]="ex05"

echo -e "${MAG}-*-*-*- Welcome to python module01 ssssupertests! -*-*-*-${NC}"

test() {
  TEST_NB=$((TEST_NB+1))
  RESULT=$(eval $1)
  echo -e "${BOLD}==> Test ${TEST_NB}:\n$1${NC}"
  echo -e "${BOLD}Description:\n$3${NC}"
  echo "> $2"
  echo "< ${RESULT}" ; 
  if [ "$2" == "$RESULT" ]; then
    echo -e "${GREEN}---------------- \xE2\x9C\x94 OK${NC}\n";
  else
    echo -e "${RED}---------------- \u274c KO${NC}\n";
    ERROR=$((ERROR+1))
  fi
}

supervise() {
  TEST_NB=$((TEST_NB+1))
  echo -e "${BOLD}Test ${TEST_NB}:\n$1${NC}"
  echo -e "${MAG} --- THIS IS A SUPERVISED TEST --- ${NC}\n"
  echo -e "${MAG}$2\n${NC}"
  echo -e "${MAG}...LAUNCHING $1...\n${NC}"
  eval $1
  echo -e "\n${MAG}...EXITED $1...\n${NC}"
  echo -e "${MAG}$2: (y/n)${NC} "
  read -n 1 -p "" answer
  while true; do
        case $answer in
                [Yy]* ) echo -e "\n${GREEN}---------------- \xE2\x9C\x94 OK${NC}\n" 
                        break ;;
                [Nn]* ) echo -e "\n${RED}---------------- \u274c KO${NC}\n" &&
                        ERROR=$((ERROR+1)) 
                        break ;;
                * ) echo -e "\n${MAG}$2: (y/n)${NC} " &&
                    read -n 1 -p "" answer ;;
        esac
  done
}

grade() {
  echo
  echo -e "${BOLD}AND YOUR GRADE IS....${NC}"
  if [ "$ERROR" == 0 ]; then
    echo -e "${GREEN}----- \xE2\x9C\x94 100% -----${NC}\n";
  else
    echo -e "${RED}----- \u274c Failed ${ERROR} tests -----${NC}\n";
  fi
  exit
}

next_exercise() {
        echo -e '-----------------------------'

        while true; do
          EX=$((EX+1))

          if [ "$EX" -ge "${#FUNCTION[@]}" ]; then 
            grade
            break
          fi

          echo "Up next: ex0${EX}"
          read -n 1 -p 'Press any key to continue... (or s to skip it)' answer
          echo
          case $answer in
                [Ss]* ) continue ;;
                * ) break ;;
          esac
        done
        
        TEST_NB=0
        echo -e "${BOLD}Ex0${EX}:${NC}"
        ${FUNCTION[${EX}]}
        next_exercise
}

# next_exercise
${FUNCTION[1]}
