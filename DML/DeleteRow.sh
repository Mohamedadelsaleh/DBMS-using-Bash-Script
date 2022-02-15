#!/bin/bash

source ./DML/ShowTables.sh

deleterow(){
    echo "Enter Table Name You want to Delete a Record From:"
    read tableName
    if [[ $tableName == '' ]]
    then

        clear
        showTables $dbName
        echo "Table name can't be Empty, Try again"
        echo " "
        deleterow
    
    elif [[ $tableName == / ]]
    then

        clear
        showTables $dbName
        echo "/ Is not a Table Name"
        deleterow
    
    elif [[ ! -d ./Databases/$dbName/$tableName ]]
    then

        clear
        showTables $dbName
        echo "Table [$tableName] doesn't Exist, Please Enter a correct Name of Table already Exist"
        deleterow
    
    else
        
        clear
        echo "All Available Rows in [$tableName] Table"
        echo "*****************************************************************************"
        echo " "
        cat ./Databases/$dbName/$tableName/$tableName"_"data
        echo " "
        echo "*****************************************************************************"
        echo "Enter Row Primary Key to Delete Row Record:"
        read rowPK
        while ! [[ $rowPK =~ ^[0-9a-zA-Z]+$ ]]
        do
        
            echo "Primary Key can't be Empty or String"
            echo " "
            echo "Enter Row Primary Key to Delete Row Record:"
            read rowPK
        
        done
        num=$(awk -v row_num=$rowPK 'BEGIN{ FS = ":"}{ if( row_num == $1 ){ print } }' ./Databases/$dbName/$tableName/$tableName"_"data)
        sed -i ''/$num/'d' ./Databases/$dbName/$tableName/$tableName"_"data
        cat ./Databases/$dbName/$tableName/$tableName"_"data
    fi
}
