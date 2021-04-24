#!/bin/bash

#####-------------------COMP30640:OS:SocialMediaProject--------------------------#####

#User:      Aryan
#DC:        2020-12-20
#DLM:       2020-12-20 
#Desc.:     Creates file to add user to friends

#Process:
##      1. Check if two argument passed
##      2. If not param error
##      3. Else:
###         1. Check if a line with the usernames exists
###         2. Check if not already friends
###         3. Add to friends.


#####-----------------------------------------------------------------------------#####

#User entered
user_entries=0
user_entries=$#


#No arguments
if [ $user_entries = 2 ];
    then
    user=$1
    friend=$2

        #check if user folder exists
            if [ -d "./$user" ] && [ -d "./$friend" ]; 
                then
                    #Check if friend already on user friend list
                    if grep -Fxq "$friend" "./$user/friends";
                        then
                        echo "Error: user already friends with this user"
                        exit 1
                    else
                        echo "OK: friend added"
                        echo "$friend" >> "./$user/friends"
                        
                    fi

                    #Note: Not adding user to friend's friend list; I'm assuming therefore that its like Twitter or Instagram where I can add somebody but they might not add me.
                
            else
                if [ -d "./$user" ];
                    then 
                    #friend does not exist as user does
                    #Note: The case where neither exist is not specified what sshould happen, so that'll trigger the user one.
                    echo 'Error: friend does not exist'
                    exit 1
                else
                    #user does not exist
                    echo 'Error: user does not exist'
                    exit 1
                fi
            fi
        
#Multiple arguments
else
        echo 'Error: parameter problem'
        exit 1
fi
