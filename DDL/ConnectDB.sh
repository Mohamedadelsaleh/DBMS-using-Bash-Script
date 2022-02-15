clear
source ./DML/Details.sh

echo "DataBases You Have: "
echo " "
ls ./Databases
echo " "
x=$(ls ./Databases | wc -l)

if [ $x -eq 0 ] 
then
    echo "There is no Databases so you can choise [1] to create your own Database or [5] to Exit"
else
    echo "Enter Database name You want to connect with :"
    read 
    if [ -z "$REPLY" ]
    then
            echo "You must Enter a correct name!, try again "
            echo " "
    elif [ -d ./Databases/$REPLY ]
    then
        clear
        echo -e "Connecting .... ${NC}\n"
        sleep 2
        clear
        ls ./Databases/$REPLY
        echo "You Now Connected to $REPLY Database"
        echo " "
        DBhandling $REPLY
        else        
        echo "There is no Database named $REPLY , Please carefully Enter a valid Name"
        echo "Enter [3] to Connect to a correct Database or [5] to Exit"
    fi 
fi