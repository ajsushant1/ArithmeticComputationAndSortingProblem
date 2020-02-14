#!/bin/bash -x

echo "/*********************************** ARITHMETIC COMPUTATION AND SORTING ***********************************/"

# VARIABLE
dictionaryLength=0

# DECLARING DICTIONARY
declare -A resultDictionary

# READING THREE NUMBER INPUT
read -p "Enter the first number :" a
read -p "Enter the Second number :" b
read -p "Enter the third number :" c

# COMPUTING ARITHMETIC OPERATION AND STORING THE REASULT IN DICTIONARY
resultDictionary[operation1]=$((a+b*c))
resultDictionary[operation2]=$((a*b+c))
resultDictionary[operation3]=`echo "scale=2; $c+$a/$b" | bc`
resultDictionary[operation4]=`echo "$a%$b+$c" | bc`

# COMPUTING DICTIONARY LENGTH
dictionaryLength=${#resultDictionary[@]}

# READING VALUES FROM THE DICTIONARY INTO THE ARRAY
for (( index=1; index<=dictionaryLength; index++ ))
do
	resultArray[index]=${resultDictionary[operation$((index))]}
done

# FUNCTON TO SORT RESULT IN DESCENDING ORDER
function descendingSort(){
	local tempArray=("$@")
	local temp=0
	for (( i=0; i<${#tempArray[@]}; i++ ))
	do
		for (( j=$((i+1)); j<${#tempArray[@]}; j++ ))
		do
			if (( $(echo "${tempArray[i]} < ${tempArray[j]}" | bc -l) ))
			then
				temp=${tempArray[i]}
				tempArray[i]=${tempArray[j]}
				tempArray[j]=$temp
			fi
		done
	done
echo ${tempArray[@]}
}

# FUNCTION CALL TO GET RESULT IN DESCENDING ORDER
sortedArray="$( descendingSort ${resultArray[@]} )"

# DISPLAYING RESULT OF ARITHMETIC OPERATION IN DESCENDING ORDER 
echo "Result of Arithmetic Operation In Descending Order : "${sortedArray[@]}
