#! /bin/bash
#Filip Gajewski 236597
# Napisz skrypt, który przeszuka zadane miejsce w systemie plików (parametr wywołania skryptu),
# a następnie wyświetli ścieżki do wszystkich plików z tego miejsca (uwzględniając wszystkie możliwe podkatalogi)
# w formacie typowym dla systemów z rodziny DOS i Windows 
# – to znaczy ze znakiem \ zamiast / oraz dowolnie wybranym oznaczeniem partycji (może być po prostu C:).

if [ $# != 1 ]
then
    echo Podales zla ilosc parametrow. Wymagana ilosc: 1
    exit 1
fi

if [ ! -d $1 ]
then
    echo Podany katalog nie istnieje
    exit 1
fi

find $1 -type f -printf '%p\n' | while read sciezka
do
    echo C:$sciezka | tr '\/' '\\'
done