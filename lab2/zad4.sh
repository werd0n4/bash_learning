#!/bin/bash

number=1

for file in `ls -S $1`
do
    if [ -f $1/$file ]
    then
        mv $1/$file $1/$file.$number
        number=$[number+1]
    fi
done