#!/bin/bash

rounds=0
total_score=0

ORIG_INPUT_FILE=../input.txt
INPUT_FILE=./input.part1.txt

cp $ORIG_INPUT_FILE $INPUT_FILE

sed -i 's/X/A/g' $INPUT_FILE
sed -i 's/Y/B/g' $INPUT_FILE
sed -i 's/Z/C/g' $INPUT_FILE

while read -r line
do
  round_score=0

  opponent=${line:0:1}
  player=${line:2:1}

  case $player in
    A)
      let "round_score+=1"
    ;;
    B)
      let "round_score+=2"
    ;;
    C)
      let "round_score+=3"
    ;;
  esac

  if [ $player = $opponent ]
  then
    let "round_score+=3"
  elif ([ $player = "A" ] && [ $opponent = "C" ]) || ([ $player = "C" ] && [ $opponent = "B" ]) || ([ $player = "B" ] && [ $opponent = "A" ])
  then
    let "round_score+=6"
  fi

  let "total_score+=round_score"

  let "rounds++"
  echo "$rounds - $round_score"
done < "$INPUT_FILE"

echo "Score: $total_score"
