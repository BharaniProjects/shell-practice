#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
ID=$(id -u)
if [ $ID -ne 0 ]
then
  echo -e "ERROR :$R Please run with root user.$N"
  exit 1
else
    echo -e "$G You are root user.$N"
fi
dnf install mysql
if [ $? -ne 0 ]
then
    echo -e "$R Installing mysql failed.$N"
    exit 1
else
    echo -e "$G Installing mysql is success.$N"