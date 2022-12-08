#!/bin/bash

rounds=0
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
      echo "+1 for rock"
    ;;
    Y)
      player="B"
      let "round_score+=2"
      echo "+2 for paper"
    ;;
    Z)
      player="C"
      let "round_score+=3"
      echo "+3 for scissors"
    ;;
  esac

  echo "$player vs $opponent"

  if [ $player = $opponent ]
  then
    let "round_score+=3"
    let "total_ties++"
    echo "+3 for tie"
  elif ([ $player = "A" ] && [ $opponent = "C" ]) || ([ $player = "C" ] && [ $opponent = "B" ]) || ([ $player = "B" ] && [ $opponent = "A" ])
  then
    let "round_score+=6"
    let "total_wins++"
    echo "+6 for win"
  else
    let "total_losses++"
    echo "+0 for loss"
  fi

  echo "round score: $round_score"
  echo "current total score: $total_score"
  let "total_score+=round_score"
done < "$input"

echo "Total wins: $total_wins"
echo "Total ties: $total_ties"
echo "Total losses: $total_losses"
echo "Score: $total_score"
