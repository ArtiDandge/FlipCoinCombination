#!/bin/bash -x 

echo "This program displays winning percentage of Head or Tail Combination in a Singlet, Doublet and Triplet"

#input number of flips respectively
read -p "how many times you want to flip the for single combination ? " flips_for_singlet
read -p "how many times you want to flip the for double combination ? " flips_for_doublet
read -p "how many times you want to flip the for triple combination ? " flips_for_triplet

#dictionary declaretion
declare -A SingletDictionary
declare -A DoubletDictionary
declare -A TripletDictionary

#Variables
heads=0
tails=0

#FLIP variable store 0 and 1  value to show heads or tails
FLIP=$(($((RANDOM%10))%2))

#loop for singlet combination of coins
for i in `seq $flips_for_singlet`
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

#loop for doublet combination of coins
for i in `seq $flips_for_doublet`
do
	doubletFlip=$(($((RANDOM%4))+1))
	case $doubletFlip in 
		1)DoubletDictionary["key$i"]=`echo "HH"`;;
		2)DoubletDictionary["key$i"]=`echo "HT"`;;
		3)DoubletDictionary["key$i"]=`echo "TH"`;;
		4)DoubletDictionary["key$i"]=`echo "TT"`;;
		*)DoubletDictionary["key$i"]=`echo "NA"`;;
	esac
done

for i in `seq $flips_for_triplet`
do
        tripletFlip=$(($((RANDOM%8))+1))
        case $tripletFlip in
                1)TripletDictionary["key$i"]=`echo "HHH"`;;
                2)TripletDictionary["key$i"]=`echo "HHT"`;;
                3)TripletDictionary["key$i"]=`echo "HTH"`;;
                4)TripletDictionary["key$i"]=`echo "THH"`;;
		5)TripletDictionary["key$i"]=`echo "TTH"`;;
                6)TripletDictionary["key$i"]=`echo "THT"`;; 
		7)TripletDictionary["key$i"]=`echo "HTT"`;;
		8)TripletDictionary["key$i"]=`echo "TTT"`;;
		*)TripletDictionary["key$i"]=`echo "NA"`;;
        esac
done


#display singlet dictionary and its percentage 
echo -e "Dictionary to show Singlet Combination : \n ${SingletDictionary[@]}"
echo "Percentage of head win: $head_percent%";
echo "Percentage of Tail win: $tail_percent%";
singlet_count=${#SingletDictionary[@]}
singlet_percentage=`echo ${#SingletDictionary[@]} | awk 'BEGIN{printf("%0.2f", '$head_percent'+'$tail_percent')}'`
echo "singlet percentage : $singlet_percentage"

#display doublet dictionary and its percentage 
echo "Dictionary to show Doublet Combination : ${DoubletDictionary[@]}"
doublet_count=${#DoubletDictionary[@]}
doublet_percent=`awk 'BEGIN{printf("%0.2f", '$doublet_count'*100)}'`
echo "Doublet Percentage : $doublet_percent%"

#display triplet dictionary and its percentage
echo "Dictionary to show Triplet Combination : ${TripletDictionary[@]}"
triplet_count=${#TripletDictionary[@]}
triplet_percent=`awk 'BEGIN{printf("%0.2f", '$triplet_count'*100)}'`
echo "Triplet Percentage : $triplet_percent%"

