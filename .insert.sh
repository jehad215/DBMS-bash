#!/bin/bash
clear
. ./myfun.sh
echo "Tables in Your database: $databaseName" 
ls $save/$databaseName
echo
echo
echo "Enter name of table you want to insert data to: "
read tbname
if [[ -f $save/$databaseName/$tbname ]]; then
        x=`grep 'PK' $save/$databaseName/$tbname | wc -w` 
        col -t -s ' '   $save/$databaseName/$tbname 2> /dev/null
        echo -e  >> $save/$databaseName/$tbname
        for((i=1; i <= x; i++))
        do
        colName=`grep PK $save/$databaseName/$tbname | cut -f$i -d" "`
        echo $"Enter values for column:$i separeted with space" 
        echo $"Your table contains:$colName   "
        read val

        chD $i $val
        if [[ $? != 0 ]]; then
          (( i = $i - 1 ))
        else
          echo -n $val" " >> $save/$databaseName/$tbname

        fi
        done
   echo "Insert Done To $tbname"
   col -t -s ' '   $save/$databaseName/$tbname 2> /dev/null

else
   echo "No such table in your database $databaseName"
   . ./.menu.sh
fi;

