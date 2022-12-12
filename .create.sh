#!/bin/bash
read -p "Enter table name: " tbname
if [[ -f $save/$databaseName/$tbname ]]; then
        echo "Table already exist, enter anoher name"
else
        touch $save/$databaseName/$tbname
        echo "Table $tbname created"
echo
read -p "Enter number of columns you want to be in $tbname: " col
echo

if [[ $col -gt 0 ]]; then
	x=0
   for (( i=1; i<=$col; i++ ))
   do
     read -p "Enter name of column number "$i" : " cname
     while [[ $x -eq 0 ]]
   do
     read -p "This column will be the primary key of table $tbname (y or n): " PK
       if [[ $PK == "y" || $PK == 'Y' ]]; then
       x=1
       echo -n "#PK:" >> $save/$databaseName/$tbname
       else
       break
       fi
       done

 echo
 read -p "Choose data type for column number:$i, int or string: " dtype
 case $dtype in
 "int" )
      echo -n $cname":$dtype:" >> $save/$databaseName/$tbname
      ;;
 "string" )
      echo -n $cname":$dtype:" >> $save/$databaseName/$tbname
      ;;
      *)
      echo "  Wrong choice"
      ((i = $i -1))
      ;;
      esac
done
echo "Your table $tbname, with $col columns, created."


else
echo "You must enter number of columns"
. ./.create.sh
fi
fi




