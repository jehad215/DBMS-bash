#!/bin/bash

save=$PWD/data
export save

echo "                           Hello in Main menu, please select a choice"
select name in "Create database" "List databases" "Connect to database" "Drop database" "Exit"
do

 case $name in
    "Create database" )
        read -p "Enter name of Database: " databaseName
	if [[ -d $save/$databaseName/ ]]; then
		echo "already Exit"
        else
               mkdir $save/$databaseName
	       echo "database $databaseName created"
        fi
    ;;
    "List databases" )
        ls $save
    ;;
    "Connect to database" )
	      read -p "Enter Name of database : " databaseName
        if [[ -d $DBMS/$save/$databaseName ]]; then

        	echo "                          You are now using $databaseName database"
        	select option in "Create table" "List tables" "Drop table" "Insert into table" "Select from table" "Delete from table" "Back to main menu"
        	do
        	 case $option in
        	    "Create table" ) . ./.create.sh
        	     ;;
        	     "List tables" ) . ./.list.sh
        	     ;;
        	     "Drop table" ) . ./.drop.sh
        	     ;;
        	     "Insert into table" ) . ./.insert.sh
        	     ;;
        	     "Select from table" ) . ./.select.sh
        	     ;;
        	     "Delete from table" ) . ./.delet.sh
        	     ;;
        	     "Back to main menu" )
                        . ./.menu.sh
        	        break
        	     ;;
        	     esac
	     done
          else
		  echo "No such database with this name."

          fi
    ;;
    "Drop database" )
        read -p "Enter Name of database you want to delete : " databaseName
	if [[ -d $save/$databaseName ]];then
             read -p "would you like to continue deleting $databaseName? (Y/N)" Y
                if [[ $Y == 'Y' ]]; then
                    rm -r $save/$databaseName
                    echo "your database $databaseName deleted successfully"
                    echo "your database:"
                    ls $save
                else
                    echo "your database $databaseName still exit"
                    echo "Your current database:"
                    ls $save
		fi    
        else
		echo "No database with this name."
       	fi
    ;;
    "Exit" )
	break
    ;;
    esac
done
