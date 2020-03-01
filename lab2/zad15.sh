#!/bin/bash

for file in $1/*
do
    if [ -d $file ]
    then
        for subfile in $file/*
        do
            echo $subfile
        done
    else
        echo $file
    fi
done