#!/bin/bash
clear;

echo "**************************************************"
echo "*            Welcome to our DBMS Engine          *"
echo "*      Made By Ahmed Ibrahim & Asmaa Mahmoud     *"
echo "*   ITI Intake 41 - cloud platfom development    *"
echo "*                Bash shell script               *"
echo "**************************************************"

#to redefine the prompt
PS3="Enter Your Choice:~$ "


echo "Please Enter Your choice From the Following Choices * "

select choice in "Create New Database" "Delete Database" "Open Specific Database" "List All Available Databases" "Exit the Application"
do
    case $REPLY in
    1) . ./CreateDatabase.sh
            ;;
    2) . ./DeleteDatabase.sh
            ;;
    3) . ./OpenDatabase.sh
            ;;
    4) . ./ListDatabases.sh
            ;;
    5)    exit
            ;;
    *)  echo "Invalid Selection * Please Try again...!"
            ;;
    esac
done

