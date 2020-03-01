#!/bin/bash

for file in `ls $1 -p | grep -v /`
do
    if [ -w $1/$file ]
    then
        touch $1/$file
    fi
done