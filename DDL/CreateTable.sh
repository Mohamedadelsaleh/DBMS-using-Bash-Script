#!/bin/bash
source ./DML/DataType.sh
source ./DML/NullValues.sh

CreateTable(){
    clear
    dbName="$1"
    echo "Enter Table Name : "
    read tableName
    clear

    if [[ ! $tableName =~  ^[a-zA-Z]+[a-zA-Z0-9]*$ ]] || [[ $tableName == '' ]]
    then

        echo "You Enter a Not Valid Name for Table, please try again:"
        CreateTable $dbName
    
    elif [[ -d ./Databases/$dbName/$tableName ]]
    then

        echo "You Enter Table Name Already Exist, You can choise another name:"
        CreateTable $dbName
    
    else

        mkdir ./Databases/$dbName/$tableName
        touch ./Databases/$dbName/$tableName/$tableName"_"desc
        touch ./Databases/$dbName/$tableName/$tableName"_"data
        echo "Enter Number Of Columns in Table: "
        read colNum
        clear
        
        until [[ $colNum =~ ^[2-9]+$ ]]
        do
            echo "Table Should Have at Least Two Column and Strings not allowed"
            echo "So, Please carefully Enter a [Number] Of Columns:"
            read colNum
            clear
        done

        #seq to print number of lines in file according to number of columns
        
        for i in $(seq $colNum)
        do
            if [[ i -eq 1 ]];
            then
                echo "Enter Primary Key Column Name: "
                read colName
                clear
                until [[ $colName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]
                do
                    echo "Invalid Primary Key Name!"
                    echo "Enter Primary Key Column Name: "
                    read colName
                    clear
                done
                #-n to remove \n from input
                echo -n $colName >> ./Databases/$dbName/$tableName/$tableName"_"desc
                dataType
                #-e to escape backslash
                echo -e ":pk" >> ./Databases/$dbName/$tableName/$tableName"_"desc
            else
                tableCols=$(awk 'BEGIN {FS=":"} {print $1}' ./Databases/$dbName/$tableName/$tableName'_desc')
    
                until [[ $colName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]] && [[ ! $tableCols == *"$colName"* ]]
                do
                    echo "Column Name Must be String and Start With Charachter and Not Repeated Before"
                    echo "Enter the Name of column $i : "
                    read colName
                    clear
                done
                echo -n $colName >> ./Databases/$dbName/$tableName/$tableName"_"desc
                dataType
                echo -e  ":" >> ./Databases/$dbName/$tableName/$tableName"_"desc
            
            fi
        done
        clear
        echo " "
        echo "***************************************************************************"
        echo " "
        echo "Your [$tableName] table is created successfully"
        echo " "
        echo "***************************************************************************"
        echo " "
        DBhandling $dbName
    fi
}
