#!/bin/bash

dir=$1
list_file=$2
tmp=`mktemp`
ls -1 $dir > $tmp

echo Pliki w folderze, ktorych nie ma na liscie: `comm -13 $list_file $tmp`
echo Pliki z listy ktorych nie ma w folderze: `comm -23 $list_file $tmp`
