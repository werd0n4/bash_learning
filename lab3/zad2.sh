#!/bin/bash
#Filip Gajewski 236597

#Napisz skrypt, który dla wszystkich plików wykonywalnych z jakiegoś katalogu (parametr wywołania skryptu) utworzy dowiązania twarde w drugim katalogu (parametr wywołania skryptu), zaś dla podkatalogów utworzy on dowiązania miękkie. Dodatkowo:
#a) skontroluj liczbę argumentów i uprawnienia do odpowiednich elementów systemu plików,
#b) nie twórz nowego dowiązania, jeżeli w drugim katalogu istnieje już dowiązanie twarde (wcześniej zakładaliśmy, że na pewno nie istnieje)
#c) zadbaj o to, żeby dowiązania symboliczne byłī stworzone względem katalogu roboczego (pwd)
#d) w przypadku podkatalogów pierwszego danego katalogu, utwórz odpowiednie odwiązania do plików z tych podkatalogów w drugim danym katalogu (załóż, że nazwy plików są unikalne)


if [ "$#" != 2 ]
then
    echo Niepoprawna liczba parametrow!
else
    for file in $1/*
    do
        if [ -f $file -a -x $file ]
        then
            wasindir=false
            for subfile in $2/*
            do
                if [ $file -ef $subfile ]
                then
                    wasindir=true
                    break
                fi
            done
            if [ $wasindir = false ]
            then
                ln $file $2/$file
            fi
        elif [ -d $file ]
        then
            ln -s -f $("pwd")/$file $2/$file
            #./$0 $file $2
        fi
    done
fi