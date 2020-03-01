#!/bin/bash

dir=$1

for subdir in $dir/*
do
    if [ -d $subdir ]
    then
        cp -r $subdir/* $dir
        rm -r $subdir
    fi
done