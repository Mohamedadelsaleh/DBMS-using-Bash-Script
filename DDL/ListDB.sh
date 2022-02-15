
# ********************** Here we List Directory Only *********************************#

listdb=`ls -Al ./Databases/ |grep ^d | wc -l`
            if [ $listdb -eq 0 ] 
            then 
                clear
                echo "There is No Databases to List!"
                echo " "
                echo "You can choise: "
                echo "[1] To create a Database"
                echo "[5] To Exit"
            else 
                clear
                echo "Databases Exist are:"
                echo " "
                ls ./Databases/ | awk -F'./Databases/' '{print $1}'
                echo " "
                echo "You can choise: "
                echo "[1] To create a new Database"
                echo "[3] To connect with a Database" 
                echo "[4] To Drop any Database You want" 
                echo "[5] To Exit"
            fi