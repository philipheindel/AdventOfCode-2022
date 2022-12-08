#!/bin/bash

total_score=0
total_wins=0
total_ties=0
total_losses=0

input="input.txt"
while IFS= read -r line
do
  round_score=0

  opponent=$(echo "$line" | cut -c1)
  player=$(echo "$line" | cut -c3)

  case $player in
    X)
      player="A"
      let "round_score+=1"
    ;;
    Y)
      player="B"
      let "round_score+=2"
    ;;
    Z)
      player="C"
      let "round_score+=3"
    ;;
  esac

  if [ $player = $opponent ]
  then
    let "round_score+=3"
    let "total_ties++"
  elif ([ $player = "A" ] && [ $opponent = "C" ]) || ([ $player = "C" ] && [ $opponent = "B" ]) || ([ $player = "B" ] && [ $opponent = "A" ])
  then
    let "round_score+=6"
    let "total_wins++"
  else
    let "total_losses++"
  fi

  let "total_score+=round_score"
done < "$input"

echo "Total wins: $total_wins"
echo "Total ties: $total_ties"
echo "Total losses: $total_losses"
echo "Score: $total_score"
