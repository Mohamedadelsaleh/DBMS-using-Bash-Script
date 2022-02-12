clear
echo "Please, Enter Your Database Name : "
read dbname

if [ -d ./Databases/$dbname ]
then
    echo "You Entered a Name of Database already Exist! "
else
    mkdir ./Databases/$dbname
    echo "Your Database with Name of $dbname Created Successfully"