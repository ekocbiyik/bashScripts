#!/bin/sh
echo "
##################################################
#                PROCESS STARTED                 #
##################################################
"

while :; do
    password=$(zenity --password)
    if [ "$?" != 0 ]; then
        echo "Operation cancelled!"
        exit
    fi

    if [ "$password" = "" ]; then
        echo 'Can not be empty!'
        continue
    fi

    variable=$(echo $password | sudo -S passwd -S root)
    if [ "$variable" != '' ]; then
        echo 'Right password!'
        break
    else
        echo 'Wrong password!'
    fi
done

echo -e "\n######################## OS RELEASE   #######################"
echo $password | sudo -S cat /etc/os-release

echo -e "\n######################## OS VERSIYON  #######################"
echo $password | sudo -S  uname -r

echo -e "\n######################## OS HOST #######################"
echo $password | sudo -S  hostnamectl

exit 1

