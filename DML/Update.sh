# echo "Your Tables in $dbName Database are: "
# ls ./Databases/$dbName/$tname

function updateTable(){

echo "Enter The Table name you want to update data in it:"
read tname;

if [ -d ./Databases/$dbName/$tname ]
then

    echo "Table's Coulmns: "
    column  ./Databases/$dbName/$tname/$tname"_"desc -t -s ":"
    echo "Enter Column Name:"
    read cname;
    result=`awk -F: '{ if("'$cname'"==$1){print result=1}}' ./Databases/$dbName/$tname/$tname"_"desc`
    fieldNumber=`awk -F: '{ if("'$cname'"==$1){print NR}}' ./Databases/$dbName/$tname/$tname"_"desc`

    if [[ $result==1 && -n $result ]]
    then

    echo "Enter Primary Key value:"
    read val;
    echo "Enter Your New value:"
    read newVal;
    echo "Your New value is $newVal"
    record=`awk -F: '{ if('$val'==$1){print $0}}' ./Databases/$dbName/$tname/$tname"_"data`
    echo "The Editable record is $record"
    awk -F:  ''$val'==$1  {$'$fieldNumber'="'$newVal'"}{for(i=1 ;i<=NF ;i++ ) { if (i==NF) print $i; else printf "%s",$i":"} }' ./Databases/$dbName/$tname/$tname"_"data >> out.tmp 
    cat out.tmp > ./Databases/$dbName/$tname/$tname"_"data 
    rm out.tmp

    fi

else

updateTable

fi
}
