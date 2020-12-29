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
            read tbnamee
               if [[ ! "$tbnamee" =~  ^[[:alpha:]][[:alnum:]]*$  ]] 
               then
                echo "Error with Naming Format of Database *" 
                echo "Must start with letter" 
                echo "Contain no spaces" 
                echo "Only AlphaNumeric is Allowed"

               elif [  -f ./Databases/$dbname/"$tbnamee" ]
               then
                   clear
                   echo "Table: ""$tbnamee"
                   cat ./Databases/$dbname/"$tbnamee"
                   break
               
               else
                     echo "The Name you enterd does't match any existing Databse *"

                fi
        done
    fi

#Operations on Specific datbase
echo "==================================================================================="
echo "Please Enter the Operation need to do on this table *"
select choice in "Insert Into Table" "Delete Specific Row" "Update Specific Record" "Back To Main Menu" "Exit the Application"
do
    case $REPLY in
    1) . ./Insert.sh
            ;;
    2) . ./DeleteRow.sh
            ;;
    3) . ./UpdateRecord.sh $dbname $tbnamee
           ;;
    4) . ./MainMenu.sh
            ;;
    5)    exit
            ;;
    *)  echo "Invalid Selection  Please Try again...!"
            ;;
    esac
done


