#!/bin/bash

#####-------------------COMP30640:OS:SocialMediaProject--------------------------#####

#User:      Aryan
#DC:        2020-12-20
#DLM:       2020-12-20 
#Desc.:     Prints wall.txt line by line.

#Process:
##      1. Check if one argument passed
##      2. If not param error
##      3. Else:
###         1. Check if user exists
###         2. Print Wall.txt file


#####-----------------------------------------------------------------------------#####

#User entered
user_entries=0
user_entries=$#


#No arguments
if [ $user_entries = 1 ];
    then
    user=$1

        #check if user folder exists
            if [ -d "./$user" ]; 
                then
                    echo 'wallStart'
                    
                    #Print File line by line
                    while read -r line; 
                        do 
                            echo "$line"; 
                        done < "./$user/wall"

                    echo 'wallEnd'
                    

            else
                echo "Error: user does not exist"
                exit 1
            fi
        
#Multiple arguments
else
        echo 'Error: parameter problem'
        exit 1
fi
