#!/bin/bash

directory=$1
file=$2
path=$3

touch $path

for item in `cat $file`
do
    echo $item >> $path
    cat $directory/$item >> $path
done