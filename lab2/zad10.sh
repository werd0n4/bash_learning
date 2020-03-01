#!/bin/bash

dir1=$1
dir2=$2

lista1=`mktemp`
lista2=`mktemp`

ls $dir1 -p | grep -v / >> $lista1
ls $dir2 -p | grep -v / >> $lista2

toRemove=`comm -12 $lista1 $lista2`
rm $dir1/$toRemove