#!/bin/bash
#Filip Gajewski
#zadanie nr 13

#sprawdz czy liczba paramterow rozna od jeden 

if [ "$#" != 1 ]
then
    echo Niepoprawna liczba parametrow!
else
    if [ ! -d $1 ]
    then
        echo Podany katalog jest niepoprawny
    else
        #Wlasciwe usuwanie plikow
        for file in $1/*
        do
            if [ -f $file -a ! -x $file ]
            then
                rm $file
            elif [ -f $file -a -x $file ]
            then
                mv $file $file.old
            elif [ -d $file ]
            then 
                ./$0 $file
            fi
        done
    fi
fi