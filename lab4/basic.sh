#!/bin/bash
#Filip Gajewski 236597
#Napisz skrypt, który dla podanego miejsca w systemie plików (parametr wykonania skryptu)
#oraz wszystkich jego podkatalogów, wypisze
# ścieżkę,
# nazwę użytkownika,
# grupy
# i uprawnienia do plików zwykłych,
#których formalnym właścicielem nie jest aktualny użytkownik (whoami).


# Sprawdzenie, czy parametry podane przez uzytkownika sa prawidlowe
if [ $# != 1 ]
then
	echo "Podales zla ilosc parametrow. Wymagane: 1";
	exit 1;
fi

find $1 -type f ! -user $(whoami) -printf "%p %u %g %m \n"