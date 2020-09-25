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

#Variables for singlet combination
heads=0
tails=0
#Variables for doublet combination
HH=0
TH=0
HT=0
TT=0
#Variables for triplet combination
HHH=0
HHT=0
HTT=0
THH=0
TTH=0
THT=0
HTH=0

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

#sort and check winner in singlet combination
if [[ $heads -gt $tails ]]
then
	echo "Winner in singlet combination : Heads"
else
        echo "Winner in singlet combination : Tails"
fi

#loop for doublet combination of coins
for i in `seq $flips_for_doublet`
do
	doubletFlip=$(($((RANDOM%4))+1))
	case $doubletFlip in 
		1)((HH++))
		DoubletDictionary["key$i"]=`echo "HH"`;;
		
		2)((HT++))
		DoubletDictionary["key$i"]=`echo "HT"`;;
		
		3)((TH++))
		DoubletDictionary["key$i"]=`echo "TH"`;;
		
		4)((TT))
		DoubletDictionary["key$i"]=`echo "TT"`;;
		
		*)DoubletDictionary["key$i"]=`echo "NA"`;;
	esac
done

#check winner in doublet combination by sorting
if [[ $HH -gt $HT ]] &&  [[ $HH -gt $TH ]] && [[ $HH -gt $TT ]]
then
	echo "Winning in doublet combination is  : HH"
elif [[ $HT -gt $HH ]] &&  [[ $HT -gt $TH ]] && [[ $HT -gt $TT ]]
then
        echo "Winning in doublet combination is  : HT"
elif [[ $TH -gt $HH ]] &&  [[ $TH -gt $HT ]] && [[ $TH -gt $TT ]]
then
        echo "Winning in doublet combination is : TH"
else
        echo "Winning in doublet combination is : TT"
fi


#loop for triplet combination of coins
for i in `seq $flips_for_triplet`
do
        tripletFlip=$(($((RANDOM%8))+1))
        case $tripletFlip in
                1)((HHH++))
		TripletDictionary["key$i"]=`echo "HHH"`;;
                
		2)((HHT++))
		TripletDictionary["key$i"]=`echo "HHT"`;;
                
		3)((HTH++))
		TripletDictionary["key$i"]=`echo "HTH"`;;
                
		4)((THH++))
		TripletDictionary["key$i"]=`echo "THH"`;;
		
		5)((TTH++))
		TripletDictionary["key$i"]=`echo "TTH"`;;
                
		6)((THT++))
		TripletDictionary["key$i"]=`echo "THT"`;; 
		
		7)((HTT++))
		TripletDictionary["key$i"]=`echo "HTT"`;;
		
		8)((TTT++))
		TripletDictionary["key$i"]=`echo "TTT"`;;
		
		*)TripletDictionary["key$i"]=`echo "NA"`;;
        esac
done

#display winner combination from triplet by sorting
if [[ $HHH -gt $HHT ]] && [[ $HHH -gt $HTH ]] && [[ $HHH -gt $THH ]]&& [[ $HHH -gt $THT ]]&& [[ $HHH -gt $HTT ]] && [[ $HHH -gt $TTT ]]
then
	echo "Winner in triplet combination is : HHH"
elif [[ $HHT -gt $HHH ]] && [[ $HHT -gt $HTH ]] && [[ $HHT -gt $THH ]]&& [[ $HHT -gt $THT ]]&& [[ $HHT -gt $HTT ]] && [[ $HHT -gt $TTT ]]
then
	echo "Winner in triplet combination is : HHT"
elif [[ $THH -gt $HHT ]] && [[ $THH -gt $HTH ]] && [[ $THH -gt $HHH ]]&& [[ $THH -gt $THT ]]&& [[ $THH -gt $HTT ]] && [[ $THH -gt $TTT ]]
then
	echo "Winner in triplet combination is : THH"
elif [[ $THT -gt $HHT ]] && [[ $THT -gt $HTH ]] && [[ $THT -gt $THH ]]&& [[ $THT -gt $HHH ]]&& [[ $THT -gt $HTT ]] && [[ $THT -gt $TTT ]]
then
        echo "Winner in triplet combination is : THT"
elif [[ $HTT -gt $HHT ]] && [[ $HTT -gt $HTH ]] && [[ $HTT -gt $THH ]]&& [[ $HTT -gt $THT ]]&& [[ $HTT -gt $HHH ]] && [[ $HTT -gt $TTT ]]
then
        echo "Winner in triplet combination is : HTT"
else
	echo "Winner in triplet combination is : TTT"
fi


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

