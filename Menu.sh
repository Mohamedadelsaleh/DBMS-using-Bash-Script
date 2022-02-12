# #!/usr/bash
echo "                                                               "
echo "Choose from DataBase MENU and Write the number of your choise : "
echo " "
PS3="Your Choise is :"
echo " "
select choise in "Create a Database" "List all Databases" "Connect to a Database" "Drop a Database" "Exit"
do 
    case $choise in 
        "Create a Database")
        . ./CreateDB.sh ;;
        "List all Databases")
        . ./ListDB.sh ;;
        "Connect to a Database")
        . ./ConnectDB.sh ;;
        "Drop a Database")
        . ./DropDB.sh ;;
        "Exit")
        exit ;;

        *)
        echo " "
        echo "You Entered unvalid choise you will redirectly again to the Main Menu!!"
        . ./Menu.sh ;;
        esac

done
