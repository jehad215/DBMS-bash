#!/bin/bash
read -p "enter name of table you want to drop: " tbname
if [[ -f $save/$databaseName/$tbname ]]; then
        rm  $save/$databaseName/$tbname
        echo "     Table $tbname deleted"       
else
        echo "No table with name $tbname"
fi

