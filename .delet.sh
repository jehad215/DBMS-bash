#!/bin/bash

read -p "Enter name of table you want to delete from: " tbname
if [[ -f $save/$databaseName/$tbname ]]; then

    select option in "Delete all data" "Delete specific data" "Exit"
    do
        case $option in
        "Delete all data" )

            echo "" > $save/$databaseName/$tbname
            echo "Data deleted from $tbname"
            ;;

        "Delete specific data" )
            read -p "Enter the primary key of table you want to delete from: " PK
            R=$(awk -F ":" '{if($1=="'$PK'") print "PK_exist" }' $save/$databaseName/$tbname)

            if [[ "$R" == "PK_exist" ]]; then
                R=$(awk -F ":" '{if($1=="'$PK'") print NR}' $save/$databaseName/$tbname)
                sed -i ''$R'd' $save/$databaseName/$tbname
                echo "Data deleted from $tbname"

            else
                echo "No such primary key "
            fi
            ;;
        "Exit")
            break
            ;;
        esac
    done


else
    echo "No such table called $tbname"
fi
