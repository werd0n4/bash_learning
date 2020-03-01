#!/bin/bash

dir1=$1
dir2=$2

lista1=`ls $dir1`
lista2=`ls $dir2`

f1=`mktemp`
f2=`mktemp`

for file in $lista1
do
    if [ -f $1/$file ]
    then
        echo $file >> $f1
    fi
done

for file in $lista2
do
    if [ -f $2/$file ]
    then
        echo $file >> $f2
    fi
done

echo `comm -12 $f1 $f2`