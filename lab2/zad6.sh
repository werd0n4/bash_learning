#!/bin/bash

for file in `ls $1`
do
    if [ -f $1/$file -a -x $1/$file ]
    then
        mv $1/$file $2/$file
    fi
done