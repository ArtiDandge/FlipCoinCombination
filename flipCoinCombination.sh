#!/bin/bash -x 

echo "This program displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"
read -p "how many times you want to flip the coin ? " max_flips
declare -A SingletDictionary

#Variables
heads=0
tails=0
k=0

#FLIP variable store 0 and 1  value to show heads or tails
FLIP=$(($((RANDOM%10))%2))

for i in `seq $max_flips`
do
	FLIP=$(($((RANDOM%10))%2))

	if [[ $FLIP -eq 1 ]]
	then
		((heads++));
		SingletDictionary["key$i"]=`echo "H"`
		head_percent=`echo $heads |awk 'BEGIN{printf("%02.2f", '$heads'*100)}'`
	else
		((tails++));
		SingletDictionary["key$i"]=`echo "T"`
		tail_percent=`echo $heads |awk 'BEGIN{printf("%02.2f", '$tails'*100)}'`
	fi
done

echo -e "Dictionary to show singlet combination : \n ${SingletDictionary[@]}"
echo "Percentage of head win: $head_percent%";
echo "Percentage of Tail win: $tail_percent%";
singlet_count=${#SingletDictionary[@]}
singlet_percentage=`echo ${#SingletDictionary[@]} | awk 'BEGIN{printf("%0.2f", '$head_percent'+'$tail_percent')}'`
echo "singlet percentage : $singlet_percentage"
