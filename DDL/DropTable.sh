#!/bin/bash
source ./DML/ShowTables.sh

dropTable(){

    echo "Enter Table Name You want to Drop:"
    read tableName
    if [[ $tableName == '' ]]
    then
        echo "Table name can't be Empty, Try again"
        echo " "
        dropTable
    elif [[ $tableName == / ]]
    then
        echo "/ Is not a Table Name"
        dropTable
    elif [[ -d ./Databases/$dbName/$tableName ]]
    then

        clear
        echo " ⚠️ WARNING !!! "
        echo "ALL DATA IN THIS Table WILL BE DELETED !"
        echo "Are You Sure You Want To Drop [$tableName] Table ? (Y,N)"
        read answer
        
        until [ flag = 0 ]
        do
            case $answer in
                [Yy] )
                    rm -r ./Databases/$dbName/$tableName
                    if [[ $? == 0 ]]
                    then
                        echo "Table [$tableName] Deleted Successfully"
                    fi
                    break ;;
                [Nn] )
                    echo "Your action is Canceled!"
                    break ;;
                *)
                    clear
                    echo "Invalid Choise, Please Enter [Y] if You want to delete Table or [N] to Cancel operation:"
                    read answer ;;
            esac
        done
    else
        
        echo "Table [$tableName] doesn't Exist, Please Enter a correct Name of Table already Exist"
        dropTable
    fi
}