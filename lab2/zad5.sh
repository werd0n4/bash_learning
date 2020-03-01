#!/bin/bash

for file in `ls $1`
do
    if [ -f $1/$file -a -w $1/$file ]
    then
    echo $file
    cat $1/$file
    fi
done