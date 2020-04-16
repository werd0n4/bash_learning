#!/bin/bash
#Filip Gajewski 236597

# Napisz skrypt, który wyświetli nazwy wszystkich dowiązań symbolicznych z danego katalogu
# (parametr wywołania skryptu), które wskazują na określone miejsce w systemie plików (parametr wywołania skryptu).

if [ "$#" != 2 ]
then
    echo Niepoprawna liczba parametrow!
else
    for link in $1/*
    do
        if [ -h $link ]
        then
            if [ $(readlink $link) = "$2" ]
            then
                echo $link
            fi
        fi
    done
fi