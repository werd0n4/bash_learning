#! /bin/bash

if [ $# != 1 ]
then
    echo Zła liczba parametrów
fi

if [ ! -d $1 ]
then
    echo Katalog nie istnieje
fi

find $1 -type l -print while read wynik
do

done