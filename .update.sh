#!/bin/bash
clear
. ./myfun.sh
read -p "Enter name of table ypu want to update it's data: " tbname

if [[ -f $save/$databaseName/$tbname ]]; then
	awk '{if (NR==1) {for(i=1;i<=NF;i++){printf "    |    "$i}{print "    |"}}}' $save/$databaseName/$tbname
	read -p "Please enter field number to update: " feld

	f=`awk '{print NF}' $save/$databaseName/$tbname | head -1`
	if [[ $feld -gt $f || $feld -lt 1 ]]; then

		echo "Not valid feild number."
		 . ./.update.sh
	else
			
         	read -p "Enter value to be updated: " up

		if grep "${up}" $save/$databaseName/$tbname  >> /dev/null
		then
			echo "Please enter new value: "
			read new
			chD $feld $new
			if [[ $? != 0 ]]; then
					echo "Incorrect"
					. ./.update.sh
				else
					 awk -v old=$up -v newv=$new -v colnum=$feld -i inplace '{ gsub(old, newv, $colnum) }; { print }' $save/$databaseName/$tbname
					echo "record updated"

					echo "Table $tbname After Updated"
					echo
					echo
					column -t -s ' '   $save/$databaseName/$tbname 2> /dev/null
				fi
		else
			echo "No such value"
			. ./.update.sh
		fi
	fi
else
	echo "No such table"

	fi
