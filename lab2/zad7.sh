#!/bin/bash

touch $1/$2

for file in $1/*
do
    if [ -f $file -a ! -s $file ]
    then
        echo $file >> $1/$2
        rm $file
    fi
done