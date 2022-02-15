
showTables(){


    if [[ $(ls ./Databases/$1 ) == "" ]]
    then
        clear
        echo "There is no Tables in Database So You can choise [2] to create a new table"
        echo " "
    else
        clear
        echo " "
        echo "Tables Exist in Database:"
        echo " "
        ls ./Databases/$1
        echo " "
        echo "***************************************************************************"
        echo " "

    fi
}
