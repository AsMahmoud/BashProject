#!/bin/bash
clear

#Deleting table
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
            echo "please Enter the Table Name of the Table you want to Delete *"
            read deletename
               if [[ ! "$deletename" =~  ^[[:alpha:]][[:alnum:]]*$  ]] 
               then
                echo "Error with Naming Format of Database *" 
                echo "Must start with letter" 
                echo "Contain no spaces" 
                echo "Only AlphaNumeric is Allowed"

               elif [ -f ./Databases/$dbname/"$deletename" ]
               then
                   rm ./Databases/$dbname/"$deletename"
                   echo "congratulations, Your Table has been Deleted successfully *"
                   break
               else
                   echo "The Name you enterd does't match any existing Table *"
               fi
        done
    fi

#check which Action the user need after completing his current operation
echo "==========================================================="
echo "please select your next action from the following actions"
PS3="Enter Your Choice:~$ "
if [ ! "$tb" == 0 ]
then
     select choice in "Delete another Table" "Back To Main Menu" "Exit the Application" 
      do
          case $REPLY in
            1). ./DeleteTable.sh
                  ;;
            2). ./MainMenu.sh
                  ;;
            3) exit
                  ;;
            *) echo "Invalid Selection * Please Try again...!"
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
            
