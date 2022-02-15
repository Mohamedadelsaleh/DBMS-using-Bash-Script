#!/bin/bash

# ********************************* Primary Key Cases ************************************ #

checkprimary(){

    dbName="$1"
    tableName="$2"
    primary="$3"
    readyToRecord=1

if [[ "$primary" = pk ]]
then

    # *************************** User didn't assign a Primary Key *********************************#

    if [[ "$colVal" != "" ]]
    then

        tableData=$(awk 'BEGIN {FS=":"} {print $1}' ./Databases/$dbName/$tableName/$tableName'_data')
        if [[ $tableData = "" ]]
        then

                echo -n "$colVal" >> ./Databases/$dbName/$tableName/$tableName'_data'
                echo -n ":" >> ./Databases/$dbName/$tableName/$tableName'_data'

        else

            # ************************ Dublicated Primary Key ****************************#

            for i in $tableData
            do

                if [ $i == $colVal ]
                then
                    echo "This value is already token before, Please Enter another value:"
                    checkConstrains $dbName $tableName
                    return 0
                fi
            done

            echo -n "$colVal" >> ./Databases/$dbName/$tableName/$tableName'_data'
            echo -n ":" >> ./Databases/$dbName/$tableName/$tableName'_data'
        fi

        # ********************* If User put a null Primary Key ******************************* #
    
    else
        echo "Primary Key must be not NULL value"
        readyToRecord=0
        checkConstrains $dbName $tableName
        return 0
    fi
else
    if [ $readyToRecord == 1 ]
    then
        echo -n "$colVal" >> ./Databases/$dbName/$tableName/$tableName'_data'
        echo -n ":" >> ./Databases/$dbName/$tableName/$tableName'_data'
    fi
fi
}

# ********************************************* Constrains ***************************** #

checkConstrains(){

    dbName=$1
    tableName=$2

    colName=$(echo "$j" | cut -d ":" -f 1)
    colDataType=$(echo "$j" | cut -d ":" -f 2)
    primary=$(echo "$j" | cut -d ":" -f 3)
    echo "Enter $colName value: "
    read colVal
    if [[ "$colDataType" = integer ]]
    then
        if [[ "$colVal" =~ ^[0-9]+$ ]]
        then
            checkprimary $dbName $tableName $primary
        else
            echo "This value invalid for Column $colName"
            checkConstrains $dbName $tableName
        fi
    fi

    if [[ "$colDataType" = string ]]
    then
        if [[ "$colVal" =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]
        then
            checkprimary $dbName $tableName $primary
        else
            echo "This value invalid for Column $colName"
            checkConstrains $dbName $tableName
        fi
    fi

}

# *********************************************** Insertion ************************************ #

insertRecord(){

    dbName="$1"
    
    if [[ $(ls ./Databases/$dbName ) == "" ]]
    then
        echo "Please Create Tables To Insert Record"
        return 0
    fi

    col=0
    echo "Enter Table Name You prefer:"
    read tableName

    if [[ ! $tableName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]] || [ ! -d ./Databases/$dbName/$tableName ]
    then
        echo "This Table Name doesn't Exist, please try again"
        insertRecord $dbName
    else
        clear
        echo "Entering Table Data: "
        echo ""
        echo "****************************************************************************"
        cat ./Databases/$dbName/$tableName/$tableName"_"data
        for j in ` cat ./Databases/$dbName/$tableName/$tableName'_desc' `
        do
            checkConstrains $dbName $tableName
        done
        echo -e "" >> ./Databases/$dbName/$tableName/$tableName"_"data

    fi
}



