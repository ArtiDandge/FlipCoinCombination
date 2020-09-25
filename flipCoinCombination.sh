#!/bin/bash -x 

echo "This program displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"

FLIP=$(((RANDOM%10)%2))

if [[ $FLIP -eq 1 ]]
then
	echo "Heads"
else
	echo "Tails"
fi
