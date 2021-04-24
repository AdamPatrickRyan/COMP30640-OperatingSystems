#!/bin/bash

#####-------------------COMP30640:OS:SocialMediaProject--------------------------#####

#User:      Aryan
#DC:        2020-12-20
#DLM:       2020-12-20 
#Desc.:     

#Process:
#    1. Need to implement functionality similar to server.sh
#    2. Check if valid inputs: client_id, request, argument


#####-----------------------------------------------------------------------------#####



user_entries=0
user_entries=$#

#This is now dropping spaces in messages.

#if not less than two entries invalid
if [ $user_entries -ge 1 ];
    then 
        client_id="$1"
        argument="$2"

        
        if [ ! -p "$client_id.pipe" ];
            then

            #make fifo client pipe
                mkfifo "$client_id.pipe"
        fi


        if [ "create" = "$argument" ];
            then
                user="$3"
                echo "$client_id" "$argument" "$user" > server.pipe
                

        elif [ "add" = "$argument" ];
            then
                user="$3"
                friend="$4"
                echo "$client_id" "$argument" "$user" "$friend" > server.pipe
            

        elif [ "post" = "$argument" ];
            then
                receiver="$3"
                sender="$4"
                message="$5"

                echo "$client_id" "$argument" "$receiver" "$sender" "$message"> server.pipe
                

        elif [ "show" = "$argument" ];
            then
                user="$3"
                echo "$client_id" "$argument" "$user" > server.pipe
                

        elif [ "shutdown" = "$argument" ];
            then
                #No args needed
                echo "$client_id" "$argument" > server.pipe
                

        else
            echo "Error: bad client request"
            
            exit 1

        fi



else
    echo "Error: parameter count error"

fi

cat "$client_id.pipe"