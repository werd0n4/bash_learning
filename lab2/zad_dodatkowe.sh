#!/bin/bash
#Filip Gajewski
#zadanie nr 13

#sprawdz czy wiecej niz jeden parametr

if [ "$2" != "" ]
then
    echo Niepoprawna liczba parametrow!
else
    if [ ! -d $1 ]
    then
        echo Podany katalog jest niepoprawny
    else
        
    fi
fi