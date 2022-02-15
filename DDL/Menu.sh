#!/bin/bash
echo "Choose from DataBase MENU and Write the number of your choise : "
echo " "
PS3="Your Choise is : "
echo " "
select choise in "Create a Database" "List all Databases" "Connect to a Database" "Drop a Database" "Exit"
do 
    case $choise in 
        "Create a Database")
        . ./DDL/CreateDB.sh ;;
        "List all Databases")
        . ./DDL/ListDB.sh ;;
        "Connect to a Database")
        . ./DDL/ConnectDB.sh ;;
        "Drop a Database")
        . ./DDL/DropDB.sh ;;
        "Exit")
        exit ;;

        *)
        echo " "
        echo "You Entered unvalid choise you will redirect again to the Main Menu!!"
        echo " " 
        . ./DDL/Menu.sh ;;
        esac

done
