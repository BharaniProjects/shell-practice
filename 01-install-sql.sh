#!/bin/bash
R="\n[31m"
G="\n[32m"
Y="\n[33m"
N="\n[0n"
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