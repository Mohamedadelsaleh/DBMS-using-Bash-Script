#!/bin/bash
source ./DML/ShowTables.sh

displayrow(){

    echo "Enter Table Name You want to Display a Row Record in It or [0] to back:"
    read tableName

    if [[ $tableName == '' ]]
    then
        clear
        showTables $dbName
        echo "Table name can't be Empty, Try again"
        echo " "
        displayrow
    elif [[ $tableName == "0" ]]
    then
        . ./DDL/ConnectDB.sh
    elif [[ $tableName == / ]]
    then
        clear
        showTables $dbName
        echo "/ Is not a Table Name"
        echo ""
        displayrow

    elif [[ ! -d ./Databases/$dbName/$tableName ]]
    then
        clear
        showTables $dbName
        echo "Table [$tableName] doesn't Exist, Please Enter a correct Name of Table already Exist"
        echo ""
        displayrow
        
    else
        if [ -s ./Databases/$dbName/$tableName/$tableName"_"data ]
        then
            echo "Data in The Table $tableName: "
            echo " "
            echo "****************************All Table Data********************************"
            echo " "
            cat ./Databases/$dbName/$tableName/$tableName"_"data
            echo " "
            echo "**************************************************************************"
            echo "**************************************************************************"
            echo " "
            echo "Enter Row's Primary Key You want to Select:"
            read rowPK
            echo " "
            echo "**************************************************************************"
            echo "Row Selected with Primary Key [$rowPK]:"
            while ! [[ $rowPK =~ ^[0-9a-zA-Z]+$ ]]
            do
                echo "Primary Key can't be Empty"
                echo "Please, Carefully Enter Row's Primary Key You want to Select:"
                read rowPK
            done
            num=$(awk -v row_num=$rowPK 'BEGIN{ FS = ":"}{ if( row_num == $1 ){for ( i=1 ; i<NF; i++) print "|",$i,"|"}}' ./Databases/$dbName/$tableName/$tableName"_"data)
            echo " "
            echo $num
            echo " "
            echo "**************************************************************************"
        else
            echo "**************************************************************************"
            echo " "
            echo "No data in table to display"
            echo " "
            echo "**************************************************************************"
            echo " "
        fi
    fi
}
