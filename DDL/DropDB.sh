clear

echo "Enter Database name you want to Drop: "
read dbName

if [ -d ./Databases/$dbName ]
then
    rm -r ./Databases/$dbName
    echo "*******************************************************************************"
    echo " " 
	echo "$dbName Database has been deleted Successfully"
    echo " "
    echo "*******************************************************************************"
    echo " "
    echo "You can choise: "
    echo "[1] To create a new Database"
    echo "[2] To List all Databases"
    echo "[3] To connect with a Database" 
    echo "[4] To Drop another" 
    echo "[5] To Exit"
else
    echo "There is no Database with this name [$dbName]"
    echo " "
    echo "You can choise: "
    echo "[4] To try to Drop again" 
    echo "[5] To Exit"
fi

