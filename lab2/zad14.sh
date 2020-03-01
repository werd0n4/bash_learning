#!/bin/bash

for file in $1/*
do
    if [ -f $file ] 
    then
        chmod u+w $file
    elif [ -d $file ]
    then
        chmod u-x $file
    fi
done