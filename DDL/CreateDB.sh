clear
echo "Please, Enter Your Database Name : "
read 
echo " "
if [ -z "$REPLY" ]
then
    echo "You must Enter a string name!, try again "
    echo " "
    echo "You can choise: "
elif [ -d ./Databases/$REPLY ]
then
    echo "You Entered a Name of Database already Exist! "
    echo " "
    echo "You can choise: "
    echo "[1] To create a DB with a new Name"
    echo "[2] To List all Databases"
    echo "[3] To connect with your own Database" 
    echo "[4] To Drop it" 
    echo "[5] To Exit"
else
    mkdir ./Databases/$REPLY
    echo "*******************************************************************************"
    echo " "
    echo "Your Database with Name of [$REPLY] Created Successfully"
    echo " "
    echo "*******************************************************************************"
    echo " "
    echo "You can choise: "
    echo "[2] To List all Databases"
    echo "[3] To connect with your own Database" 
    echo "[4] To Drop it" 
    echo "[5] To Exit"
fi
