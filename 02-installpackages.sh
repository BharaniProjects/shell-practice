#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE

validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 $R FAILED..$N"
        exit 1
    else
        echo -e "$2 $G SUCCESS..$N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R Please run this script with root access.$N"
    exit 1
else
    echo -e "$G you are root user."
fi
for packages in $@
do
    dnf list installed $packages &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        dnf install $packages -y &>> $LOGFILE
        validate $? "Installing $packages"
    else
        echo -e "$packages already installed..$Y SKIPPING..$N"
    fi
done