#!/bin/bash

dataType(){
    loop=1
    while [ $loop -eq 1 ]
    do
        echo "Choose The [Data-type] of [$colName] Column from The List blow:"
        echo "[1] String"
        echo "[2] Integer"
        echo "Your Choise:"
        read colType
        clear

        case $colType in
            1)
                echo -e -n ":string" >> ./Databases/$dbName/$tableName/$tableName"_"desc
                loop=0 ;;
            2)
                echo -e -n ":integer" >> ./Databases/$dbName/$tableName/$tableName"_"desc
                loop=0 ;;
            *)
                echo "Invalid Choise, You can only Choise between [1] or [2]"
                dataType ;;
        esac
    done
}
