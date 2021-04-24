#!/bin/bash

#####-------------------COMP30640:OS:SocialMediaProject--------------------------#####

#User:      Aryan
#DC:        2020-12-20
#DLM:       2020-12-20 
#Desc.:     Creates directory to make a new user

#Process:
##      1. Check if one argument passed
##      2. If not param error
##      3. Else:
###         1. Check if a directory with the username exists
###         2. If yes, already Exists
###         3. If no then make the directories.


#####-------------------COMP30640:OS:SocialMediaProject--------------------------#####

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
                # User exists
                echo 'Error: user already exists'
                exit 1
            else
                #user does not exist yet - make the directories.
                mkdir "./$user"
                touch "./$user/wall"
                touch "./$user/friends"
                echo 'OK: user created'
                

            fi
        
#Multiple arguments
else
        echo 'Error: parameters problem'
        exit 1
fi
