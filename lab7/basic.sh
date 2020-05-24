#! /bin/bash
#Filip Gajewski 236597
#
# Pobierz plik http://datko.pl/SO2/kant.txt - najlepiej użyj programu wget z poziomu konsoli (składnia: wget <adres-pliku>).
# Następnie napisz skrypt, który z całej zawartości tego pliku zwróci (wypisze na ekran) 
# wszystkie adresy e-mail (tylko i wyłącznie adresy; każdy znaleziony adres wypisać w nowej linii).

wget http://datko.pl/SO2/kant.txt -O "kant.txt"

awk '{
        for(i=1;i<=NF;i++) 
        {
            if($i ~ /[a-zA-Z0-9]*@[a-zA-Z0-9]*\.[a-zA-Z0-9]*/)
            {
                email = gensub("[<>,]", "", "g", $i);
                print email
            }
        } 
    }' kant.txt
