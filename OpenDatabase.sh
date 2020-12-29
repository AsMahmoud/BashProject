#!/bin/bash
clear

    if ! [ -d ./Databases ]
    then
         mkdir ./Databases
    fi

#Open Specific datbase
db=`ls ./Databases | wc -l`

    if [ "$db" == 0 ]
    then
        echo "Unfortunately, There are no databases Recorded *"

    else
        echo "Your available Databases are: "
        ls ./Databases | awk '{print NR, "-", $0}'
        echo "==========================================================="
        while true
        do
            echo "please Enter the Database Name of the Database you want to open *"
            read dbname
               if [[ ! "$dbname" =~  ^[[:alpha:]][[:alnum:]]*$  ]] 
               then
                echo "Error with Naming Format of Database *" 
                echo "Must start with letter" 
                echo "Contain no spaces" 
                echo "Only AlphaNumeric is Allowed"

               elif [ ! -d ./Databases/"$dbname" ]
               then
                   echo "The Name you enterd does't match any existing Databse *"
               
               else
                     break

                fi
        done
    fi

#Operations on Specific datbase
echo "==================================================================================="
echo "please select your next action from the following actions"
PS3="Enter Your Choice:~$ "
if [ ! "$db" == 0 ]
then
        select choice in "Create New Table" "Delete Specific Table" "Open Specific Table" "List All Available Database Tables" "Back To Main Menu" "Exit the Application"
        do
        case $REPLY in
        1) . ./CreateTable.sh 
                ;;
        2) . ./DeleteTable.sh
                ;;
        3) . ./ListSpecificTable.sh
                ;;
        4) . ./ListTables.sh
                ;;
        5) . ./MainMenu.sh
                ;;
        6)    exit
                ;;
        *)  echo "Invalid Selection  Please Try again...!"
                ;;
        esac
        done
else
     select choice in "Back To Main Menu" "Exit the Application" 
      do
          case $REPLY in
            1). ./MainMenu.sh
                  ;;
            2) exit
                  ;;
            *) echo "Invalid Selection * Please Try again...!"
                  ;;
          esac
      done
fi       


