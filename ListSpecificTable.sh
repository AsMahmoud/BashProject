#!/bin/bash
clear


#Open Specific Table
tb=`ls ./Databases/$dbname | wc -l`

    if [ "$tb" == 0 ]
    then
        echo "Unfortunately, There are no Tables Recorded *"

    else
        echo "Your available Tables are: "
        ls ./Databases/$dbname | awk '{print NR, "-", $0}'
        echo "==========================================================="
        while true
        do
            echo "please Enter the Table Name of the Table you want to List *"
            read tbname
               if [[ ! "$tbname" =~  ^[[:alpha:]][[:alnum:]]*$  ]] 
               then
                echo "Error with Naming Format of Database *" 
                echo "Must start with letter" 
                echo "Contain no spaces" 
                echo "Only AlphaNumeric is Allowed"

               elif [  -f ./Databases/$dbname/"$tbname" ]
               then
                   clear
                   echo "Table: ""$tbname"
                   cat ./Databases/$dbname/"$tbname"
                   break
               
               else
                     echo "The Name you enterd does't match any existing Databse *"

                fi
        done
    fi

#Operations on Specific datbase
echo "==================================================================================="
echo "Please Enter the Operation need to do on this table *"
PS3="Enter Your Choice:~$ "
if [ ! "$tb" == 0 ]
then
    select choice in "Insert Into Table" "Delete From Table" "Update Specific Record" "Back To Main Menu" "Exit the Application"
    do
        case $REPLY in
        1) . ./InsertIntoTable.sh
                ;;
        2) . ./DeleteFromTable.sh
                ;;
        3) . ./UpdateRecord.sh 
            ;;
        4) . ./MainMenu.sh
                ;;
        5)    exit
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




