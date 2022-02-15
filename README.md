# BashDB
# Database Managment System with Bash Script
DBMS Project Engine created using [Bash Script], includes Script files like SQL queries [DDL & DML] are run as commands from wherever you are using terminal.

## Table of contents
* [Setup](#setup)
* [Usage](#usage)
* [Demo](#demo)
* [Authors](#authors)
* [Documentations](#documentations)
***

## Setup

Install our project :

```bash
git clone https://github.com/Mohamedadelsaleh/BashDB.git
```
Then Enter the directory and take its path :

```bash
 cd BashDB
 echo $PWD   
```
Then open .bashrc file :
```bash
vi ~/.bashrc
or
gedit ~/.bashrc
```
Then write on it :
```bash
PATH="[our project directory path you take above]:$PATH"
alias DBMS='db.sh'
```
Then close the terminal and re-open it.
Finally, you can use our DBMS easily.
## Usage
You can run our DBMS engine from anywhere you want to include a database system by runnig this command :
```bash
DBMS
or
db.sh
```
Then you can use selector app :

![Screenshot from 2022-01-21 23-39-43](https://user-images.githubusercontent.com/42323978/150604087-cc78bf7d-40b0-4391-94b4-011183f1d216.png)

Or you can run any of our scripts separately :
```bash

- Create Database
- Connect to a Database
- List all Databases
- Drop a Database
- Exit

- Creat Tables
- Update Tables
- Display Tables
- Delete Tables
- Insert Rows
- Display Rows
- Update Rows
- Delete Rows
```
## Authors

* [Mohamed Adel Salah Gouda](https://github.com/Mohamedadelsaleh)
* [Mohamed Rashed](https://github.com/mhmadrashd) 

# Built With :
* JavaFX 
* postgresql 
* CSS

## References For You
You can also check out some documentation to understand how SQL queries work and how bash scripts work on Linux.

- [MySQL](https://dev.mysql.com/doc/)
- [PostgreSQL](https://www.postgresql.org/docs/)
- [Linux Kernel](https://www.kernel.org/doc/html/latest/)
- [Bash](https://devdocs.io/bash/)

