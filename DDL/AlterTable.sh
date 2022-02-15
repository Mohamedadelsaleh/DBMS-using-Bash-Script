source ./DML/Insert.sh

alterTable(){
    
    if [[ $(ls ./Databases/$dbName ) == "" ]]
    then
        echo " Please Create Tables First then You can Update it !"
        return 0
    fi
    
    showTables $dbName
    echo "Enter the Table name You want to Alter it:"
    read tableName
    if ! [[ $tableName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]
    then
        echo "Wrong Enter, Table Name Must be String"
        alterTable
    fi
    if [ ! -d ./Databases/$dbName/$tableName ]
    then
        echo "There isn't a valid Table with this name, please try again "
        alterTable
    else
        alterloop=1
        while [ $alterloop -eq 1 ]
        do
            echo "Choose From the List:"
            echo "[1] Change Table Name"
            echo "[2] Add New Field"
            echo "[3] Edit on Field"
            echo "[4] Delete Field"
            echo "[0] Back"
            echo " "
            echo "Your Choise is:"
            read choice
            case $choice in
                1)
                    # Added Here
                    echo "Enter New Table Name: "
                    read newtableName
                    until [[ $newtableName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]
                    do
                        echo "Enter New Table Name: "
                        read newtableName
                    done
                    mv ./Databases/$dbName/$tableName/$tableName"_"desc ./Databases/$dbName/$tableName/$newtableName"_"desc
                    mv ./Databases/$dbName/$tableName/$tableName"_"data ./Databases/$dbName/$tableName/$newtableName"_"data
                    mv ./Databases/$dbName/$tableName ./Databases/$dbName/$newtableName
                    tableName=$newtableName
                    echo "*****************************************************************"
                    echo " "
                    echo "New Table Name is Applied successfully"
                    echo " "
                    echo "*****************************************************************"
                ;;
                
                2)
                    echo "Enter New Field Name:"
                    read colName
                    until [[ $colName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]
                    do
                        clear
                        echo "Invalid Column Name"
                        echo "Please,Carefully Enter New Field Name again: "
                        read colName
                    done
                    echo -n $colName >> ./Databases/$dbName/$tableName/$tableName"_"desc
                    datatypeSelect
                    echo -e  ":" >> ./Databases/$dbName/$tableName/$tableName"_"desc
                    echo "New name [$colName] Field is added to $tableName successfully"
                ;;

                3)
                    fields=$(awk 'BEGIN {FS=":"} {print $1}' ./Databases/$dbName/$tableName/$tableName"_"desc)
                    echo "*****************************************************************"
                    echo " "
                    echo "Existed Fields are:"
                    echo "$fields"
                    echo " "
                    echo "*****************************************************************"
                    echo " "
                    echo "Enter Field Name to edit it:"
                    read colName
                    # Added Here
                    if [[ $colName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]
                    then
                        field=$(sed -n "/^$colName:.*/p" ./Databases/$dbName/$tableName/$tableName"_"desc)
                    else
                        echo "Wrong Enter, Column Name Must be String"
                        alterTable
                    fi

                    
                    if [[ $field != "" ]]
                    then
                        firstfield=$(echo "$field" | cut -d ":" -f 1)
                        secondfield=$(echo "$field" | cut -d ":" -f 2)
                        thirdfield=$(echo "$field" | cut -d ":" -f 3)
                        
                        echo "Choose from the List:"
                        echo "[1] Rename Field"
                        echo "[2] Change Data-Type"
                        echo "Your Choise is:"
                        read choice
                        case $choice in
                            1)
                                echo "Enter New Name of Field:"
                                read newfieldname
                                until  [[ $newfieldname =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]
                                do
                                    clear
                                    echo "Wrong Enter, Field Name Must Be String"
                                    echo "Enter New Name of Field:"
                                    read newfieldname
                                done
                        
                                firstfield=$newfieldname
                            ;;
                            
                            2)
                                echo "Choose from the List:"
                                echo "[1] Data-Type is string"
                                echo "[2] Data-Type is integer"
                                echo "Your Choise is:"
                                read colType
                                case $colType in
                                    1)
                                        secondfield="string"
                                    ;;
                                    
                                    2)
                                        secondfield="integer"
                                    ;;
                                    *)
                                        echo "Wrong Entry, Please try again"
                                    ;;
                                esac
                            ;;
                            *)
                                echo "Wrong Entry, please try again"
                            ;;
                            
                        esac
                        
                        newfield="$firstfield:$secondfield:$thirdfield"
                        
                        sed -i "s/^$colName:.*/$newfield/" ./Databases/$dbName/$tableName/$tableName"_"desc
                    else
                        echo "Wrong Field"
                    fi
                    
                ;;
                
                4)
                    while true
                    do
                        fields=$(awk 'BEGIN {FS=":"} {print $1}' ./Databases/$dbName/$tableName/$tableName"_"desc)
                        echo "*****************************************************************"
                        echo " "
                        echo "Existed Fields are:"
                        echo "$fields"
                        echo " "
                        echo "*****************************************************************"
                        echo " "
                        echo "Enter Field Name to Delete it:"
                        read colName
                        field=$(sed -n "/^$colName:.*/p" ./Databases/$dbName/$tableName/$tableName"_"desc)
                        if  [[ $field = "" ]]
                        then
                            clear
                            echo "Field isn't Exist"
                        else
                            thirdfield=$(echo "$field" | cut -d ":" -f 3)
                            if [[ $thirdfield == "pk" ]]
                            then
                                echo "You Can't Delete Primary Key field"
                                alterTable
                            else
                                clear
                                sed -i '/'$colName'/d' ./Databases/$dbName/$tableName/$tableName"_"desc
                                echo "Great, $colName column is deleted from $tableName successfully"
                                break
                            fi
                        fi
                    done
                ;;
                
                
                
                0)
                    alterloop=0
                    clear
                ;;
                
                *)
                    echo "Invalid Input, Please Carefully Enter a correct value"
                    echo " "
                ;;
            esac
        done
    fi
}

datatypeSelect(){
    typeloop=1
    while [ $typeloop -eq 1 ]
    do
        echo "Choose The [Data-type] of [$colName] Column from The List blow:"
        echo "[1] String"
        echo "[2] Integer"
        echo "Your Choise:"
        read colType

        case $colType in
            1)
                echo -e -n ":string" >> ./Databases/$dbName/$tableName/$tableName"_"desc
                typeloop=0 ;;
            
            2)
                echo -e -n ":integer" >> ./Databases/$dbName/$tableName/$tableName"_"desc
                typeloop=0 ;;
            *)
                echo "Invalid Choise, You can only Choise between [1] or [2]"
                datatypeSelect ;;
        esac
    done
}
