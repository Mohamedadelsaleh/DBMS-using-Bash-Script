#!/bin/bash
source ./DML/ShowTables.sh

displayTable(){

    while true
    do

        echo "Enter Table Name You want to Display:"
        read tableName
        if [[ $tableName == '' ]]
        then

            echo "Table name can't be Empty, Try again"
            echo " "
            displayTable

        elif [[ $tableName == / ]]
        then
            showTables $dbName
            echo "/ Is not a Table Name"
            displayTable

        elif [[ ! -d ./Databases/$dbName/$tableName ]]
        then
            showTables $dbName
            echo "Table [$tableName] doesn't Exist, Please Enter a correct Name of Table already Exist"
            displayTable
        else
            clear
            echo "Please, Choise from [1] or [2]"
            echo " "
            echo "[1] Diplay Table $tableName Description"
            echo "[2] Diplay Table $tableName Data"
            read answer
            
            case $answer in
                1)
                    clear
                    echo "Great, You Choise to Display Table $tableName Description"
                    echo " "
                    echo "**************************************************************************"
                    echo " "
                    cat ./Databases/$dbName/$tableName/$tableName"_"desc
                    echo " "
                    echo "**************************************************************************"
                    break ;;
                2)
                    
                
                    clear
                    echo "Great, You Choise to Display Table $tableName Data"
                    echo " "
                    echo "**************************************************************************"
                    echo " "
                    cat ./Databases/$dbName/$tableName/$tableName"_"data
                    echo " "
                    echo "**************************************************************************"
                    break ;;
                *)
                    echo "Invalid Choise, Please Choose from [1] or [2] and try again!"
            esac
        fi
        break
    done
}