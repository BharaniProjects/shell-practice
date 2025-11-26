#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0n"
ID=$(id -u)
if [ $ID -ne 0 ]
then
  echo -e "ERROR :$R Please run with root user.$N"
  exit 1
else
    echo "$G You are root user.$N"
fi
dnf install mysql
if [ $? -ne 0 ]
then
    echo "$R Installing mysql failed.$N"
    exit 1
else
    echo "$G Installing mysql is success.$N"