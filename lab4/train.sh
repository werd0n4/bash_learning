#! /bin/bash

#Dane są drzewa katalogowe D1 oraz D2 (argument skryptu).

#Usunąć wszystkie pliki .png (nie muszą być to prawdziwe png, 
#liczy się rozszerzenie) o rozmiarze mniejszym niż 200 bajtów (2 p).
find . -name "*.png" -size -200c -delete

#Znaleźć katalogi, do których: właściciel pliku ma prawo odczytu 
#lub inni nie mają prawa wykonania (4 p).
find . -type d -perm -400 -o ! -perm -001 

#Znaleźć linki symboliczne do plików innych niż zwykłe (2 p).
find . -type l ! -xtype f

#Wypisać dla plików zwykłych: numer i-noda, rozmiar pliku oraz 
#datę ostatniej modyfikacji 
find . -type f -printf "%i %s %t\n"


find "$1" "$2" -maxdepth 3 \( -type f -name "*.png" -size -200c -delete \) , \
\( -type d -perm -400 -o ! -perm -001 -print \) , \
\( -type l ! -xtype f -print \) , \
\( -type f -printf '%i %s %t\n' \)


# W zadanym drzewie katalogow znalezc (pod)katalogi zawierajace wiecej niz dwa
# podkatalogi, do ktorych wlasciciel nie ma prawa zapisu ani odczytu a grupa
# lub inni maja prawo zapisu.

find . -maxdepth 1 -type d -links +4 ! -perm 600 -perm 022



