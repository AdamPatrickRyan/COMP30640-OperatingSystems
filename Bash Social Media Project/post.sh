#!/bin/bash

#####-------------------COMP30640:OS:SocialMediaProject--------------------------#####

#User:      Aryan
#DC:        2020-12-20
#DLM:       2020-12-20 
#Desc.:     Creates post on person's wall

#Process:
##      1. Check if three argument passed
##      2. If not param error
##      3. Else:
###         1. Check if a line with the usernames exists
###         2. Check if already friends
###         3. If friends, post a message onto the wall file.


#####-----------------------------------------------------------------------------#####

#User entered
user_entries=0
user_entries=$#


#No arguments
if [ $user_entries = 3 ];
    then
    receiver="$1"
    sender="$2"
    message="$3"

        #check if user folder exists
            if [ -d "./$receiver" ] && [ -d "./$sender" ]; 
                then
                    #Both exist

                    #Check if the sender is in the receiver's friend file
                    if grep -Fxq "$sender" "./$receiver/friends";
                        then
                        echo "OK: Message posted to wall"
                        echo "$sender: $message" >> "./$receiver/wall"
                        

                    else
                    #Receiver does not like the sender so shouldn't receive message
                        echo "Error: Sender is not a friend of receiver"
                        exit 1
                    fi

                    #Note: Not adding user to friend's friend list; I'm assuming therefore that its like Twitter or Instagram where I can add somebody but they might not add me.
                






            #Identical to add so just ignore this but until it becomes relevant
            else
                if [ -d "./$receiver" ];
                    then 
                    #friend does not exist as user does
                    #Note: The case where neither exist is not specified what sshould happen, so that'll trigger the user one.
                    echo 'Error: receiver does not exist'
                    exit 1
                else
                    #user does not exist
                    echo 'Error: sender does not exist'
                    exit 1
                fi
            fi
        
#Multiple arguments
else
        echo 'Error: parameter problem'
        exit 1
fi
