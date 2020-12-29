#!/bin/bash
clear

dbname=$1
while true
do
    while true
    do
     #Entering the name of the new Table with format checking
     echo "please enter the name of your new Table"
     read tablename
   #  export tablename
          if [[ ! "$tablename" =~  ^[[:alpha:]][[:alnum:]]*$  ]] 
          then
                echo Error with Naming Format of the table 
                echo Must start with letter 
                echo Contain no spaces 
                echo Only AlphaNumeric is Allowed
            else
                  break     
            fi
    done

     #check if this name already exist or not
        if [ -f ./Databases/$dbname/"$tablename" ]
        then
            echo "Unfortunately, This Name Is Already Exist, Try Again With Another Name "
        else
            counter=1
            sepeator=":"

            #determing number of columns
            while true
            do
               echo "Please Enter the Number of coulmns"
               read nocoulms
                  if [[ ! "$nocoulms" =~  ^[1-9][0-9]*$  ]]
                  then
                        echo "please enter valid number"
                  else
                           break
                  fi
            done
                  
            #datatype of the primary key
            #Primary key data type always integer 
            while true
            do
               echo "Please Enter the Name Of Primary Key"
               read primary
               if [[ ! "$primary" =~  ^[[:alpha:]][[:alnum:]]*$  ]] 
                  then
                        echo Error in Naming Format of Column 
                        echo Must start with letter 
                        echo Contain no spaces 
                        echo Only AlphaNumeric is Allowed
                  else
                        break
               fi  
            done
            metadatatypes="integer"
            metadatanames=$primary

            #input the data of other columns
            # typeset -i nocoulms
            # typeset -i counter
            ((nocoulms=nocoulms-1))
            while [ $counter -le $nocoulms ]
            do
                  while true
                  do
                     echo "Please Enter the Name of coulmn $(( $counter+1 ))" 
                     read columnname    
                        if [[ ! "$columnname" =~  ^[[:alpha:]][[:alnum:]]*$  ]] 
                        then
                              echo Error in Naming Format of Column 
                              echo Must start with letter 
                              echo Contain no spaces 
                              echo Only AlphaNumeric is Allowed
                        else
                              break
                        fi  
                  done

                 #check if the input column name is exist or not
                  for var in `echo ${column[@]}`
                  do
                     if [ $var = $columnname ]
                     then
                           echo "This name already Exist"
                     fi
                  done

                  #input the columns data type
                  echo "Please Determine your column Data Type"
                  while true
                  do
	                  echo "1) integer"
	                  echo "2) string"
	                  read option
	                     case $option in
	                        1)
		                        columntype="integer" 
                                 break
		                              ;;
	                        2)
		                        columntype="string" 
                                 break
		                              ;;
	                        *)
		                        echo "Invalid Option"
		                              ;;
	                        esac
                  done
                        metadatatypes=$metadatatypes$sepeator$columntype
                        metadatanames=$metadatanames$sepeator$columnname
                              ((counter=counter+1))
            done
                  touch ./Databases/$dbname/"$tablename"
                  echo $metadatatypes >> ./Databases/$dbname/"$tablename"
                  echo $metadatanames >> ./Databases/$dbname/"$tablename"
                  echo "congratulations, Your Table Added successfully "
                           break
        fi
done
#check which Action the user need after completing his current operation
echo "==========================================================="
echo "please select your next action from the following actions"
PS3="Enter Your Choice:~$ "
select choice in "Add another Table" "Back To Main Menu" "Back to another Database" "Exit the Application" 
do
   case $REPLY in
    1). ./CreateTable.sh $dbname
       ;;
    2). ./MainMenu.sh
       ;;
    3). ./OpenDatabase.sh
       ;;
    4) exit
       ;;
    *) echo "Invalid Selection * Please Try again...!"
       ;;
    esac
done