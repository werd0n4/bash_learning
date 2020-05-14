#!/bin/bash
#Zadanie Tymka
#
# Napisz skrypt, który dla wskazanego miejsca w systemie plików (parametr wywołania skryptu):
# a) wyszuka i zliczy (wc) ile jest plików wykonywalnych (dla podmiotu uruchamiającego skrypt)
# b) wyświetli ścieżki do skryptów (wykonywalnych plików tekstowych – file -i)
# c) sprawdzi, czy podany w nagłówku skryptu (head) interpreter (zapis #!/ścieżka) istnieje w lokalnym systemie
# d) wyświetli ostrzeżenie w przypadku plików wykonywalnych, które były zmodyfikowane w ciągu ostatniego tygodnia

if [ ! $# = 1 ]
then
    echo Zła liczba argumentów!
    exit 1
fi

#find "$1" -type f -printf "%p\n" -exec test -x {} \; -print | wc -l
#find "qq$1" -type f -exec test -x {} \; -printf "%p\n"
#find $SHELL -exec test -e {} \; -print
#find "$1" -type f -exec test -x {} \; -mtime -7 -printf "%p - modyfikowany w tym tygodniu\n"