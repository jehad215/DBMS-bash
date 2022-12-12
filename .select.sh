#!/bin/bash


function all(){
   echo $'\n'
   column -t -s ' '   $save/$databaseName/$tbname 2> /dev/null
}

function specific(){
   read -p $"\nPlease enter a search value to select records: " value
   awk "/$value/" $save/$databaseName/$tbname | cat
}

read -p "Enter name of table you want to select from : " tbname
if [[ -f $save/$databaseName/$tbname ]]; then
	echo $'\n'
        awk '{if (NR==1) {for(i=1;i<=NF;i++){printf "    |    "$i}{print "    |"}}}' $save/$databaseName/$tbname
while true
	do
	 select option in "all" "Specific"
                do
                        case $val in
                         "all" )
                            all
                            break
                         ;;
                          "specific" )
                            specific
                            break
                         ;;
                    esac
        done    

	done
else
	echo "No such table"
		./.menu.sh
fi


