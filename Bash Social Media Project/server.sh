#!/bin/bash

#####-------------------COMP30640:OS:SocialMediaProject--------------------------#####

#User:      Aryan
#DC:        2020-12-20
#DLM:       2020-12-20 
#Desc.:     Server

#Process:
##      1. Pretty much exactly as the briefing describes. Read input, case statement, call x.sh where x=input[0]
### For Section 4: make the pipe if not
### Client Id is now the first input so push up all by one
### send all to client pipe


#####-----------------------------------------------------------------------------#####


if [ ! -p server.pipe ];
    then

    #make fifo serv pipe
        mkfifo server.pipe
fi


while true;  
    do
    #Get the input
        read -a user_input < server.pipe

        client_id="${user_input[0]}"

        user_request="${user_input[1]}"
        user="${user_input[2]}" #User is always the second input in all scripts

    case $user_request in

            create)
                #Only need user
                #call script
                ./create.sh "$user" > "$client_id.pipe"
                ;;

            add)
                #User is first, friend second
                friend="${user_input[3]}"  > "$client_id.pipe"
  

                #call script
                ./add.sh "$user" "$friend"  > "$client_id.pipe"
                ;;

            post)
                receiver="$user"
                sender="${user_input[3]}"
                message="${user_input[4]}"
                #call script
                ./post.sh "$receiver" "$sender" "$message"  > "$client_id.pipe"
                ;;


            show)
                #Only need user

                #call script
                ./show.sh "$user"  > "$client_id.pipe"
                ;;

            shutdown)
                echo "Success: server shutting down"
                exit 0
                ;;

            *)
                echo "Error: bad request"
                exit 1
                ;;
    esac
done
