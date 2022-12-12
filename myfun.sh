#!/bin/bash
#Check DateType
function chD() {
datatype=`grep PK $save/$databaseName/$tbname | cut -f$1 -d" "`  

if [[ "$datatype" == *"1"* ]]
then
	num='^[0-9]+$'	
	if ! [[ $2 =~ $num ]]
	then
		echo "Please Enter Numbers Only !!"
		return 1
	else
		chPK $1 $2
	fi
elif [[ "$datatype" == *"2"* ]] #match if wor string exist in datatype variable 
then
	str='^[a-zA-Z]+$'
	if ! [[ $2 =~ $str ]]
	then
		echo "False input: Not a valid string!"
		return 1
	else
		chPK $1 $2
	fi
fi
}

#Check Primary Key function
function chPK() {
header=`grep PK $save/$databaseName/$tbname | cut -f$1 -d" "` #return all feild that containing primary key
if [[ "$header" == *"PK"* ]]
then 
	if [[ `cut -f$1 -d" " $save/$databaseName/$tbname | grep -w $2` ]]
	then
		echo $'\nPrimary Key already exists. no duplicates allowed!' 
		return 1
	fi
fi
}



