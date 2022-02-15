#!/bin/bash

nullvalue(){

    echo  "Column [$colName] Accept Null Values if Yes Enter [Y] if No Enter [N]: "
    read answer
    clear
    
    if [ $answer == 'y' ] || [ $answer == 'Y' ]
    then

        echo ":Null" >> ./Databases/$dbName/$tableName/$tableName"_"desc
    
    elif [ $answer == 'n' ] || [ $answer == 'N' ]
    then

        echo -e -n ":NotNull" >> ./Databases/$dbName/$tableName/$tableName"_"desc
    
    else
        echo "Invalid Choise, You must Enter [Y] if Accept Null values OR [N] if doesn't Accept Null values"
        nullvalue
    fi
}