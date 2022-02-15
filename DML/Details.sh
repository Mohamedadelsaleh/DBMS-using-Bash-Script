#!/bin/bash


source ./DML/ShowTables.sh 
source ./DDL/CreateTable.sh 
source ./DML/Insert.sh 
source ./DDL/DropTable.sh
source ./DML/DeleteRow.sh  
source ./DML/SelectAllFromTable.sh
source ./DDL/AlterTable.sh
source ./DML/SelectRow.sh
source ./DML/Update.sh

DBhandling(){
    clear
    dbName=$1
    echo "The Database Selected is $dbName"
    echo " "
    loop=1
    
    while [ $loop -eq 1 ]
    do
        
        echo "Choose from the List:"
        echo "[1] Show Tables" 
        echo "[2] Create New Table"
        echo "[3] Alter Table"
        echo "[4] Delete Table "
        echo "[5] Insert Record"
        echo "[6] Delete Record"
        echo "[7] Display Table"
        echo "[8] Display Row"
        echo "[9] Update Data In Table"
        echo "[0] Back"
        echo " "
        echo "Your choice is: " 
        read choice

        case $choice in
            1)
                showTables $dbName ;;
            2)
                CreateTable $dbName ;;
            3)
                alterTable $dbName ;; 
            4)
                showTables $dbName
                dropTable $dbName ;;
            5)
                showTables $dbName
                insertRecord $dbName ;;
            6)
                showTables $dbName
                deleterow $dbName ;;
            7)
                showTables $dbName
                displayTable $dbName ;;
            8)
                showTables $dbName
                displayrow $dbName ;;
            9)
                updateTable $dbName ;;
            0)
                loop=0
                clear
                echo "You can choise: "
                echo "[1] To create a new Database"
                echo "[2] To List all Databases"
                echo "[3] To connect with a Database" 
                echo "[4] To Drop Database" 
                echo "[5] To Exit" ;;
            *)
                echo "You Enter unvalid Number, Please carefully choise from the list again" 
                echo " ";;
        esac
    done    
}
