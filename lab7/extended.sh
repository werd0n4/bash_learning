#! /bin/bash
#Filip Gajewski 236597
#
# Proszę opracować skrypt, który przy pomocy wyrażeń regularnych wykona odpowiednie akcje
# na podanych plikach (można je uprzednio pobrać na dysk lub ładować bezpośrednio z sieci wewnątrz skryptu - dowolnie). Proszę:
#
# a) wczytać plik http://datko.pl/SO2/qemu-io.c i wyświetlić jego treść, modyfikując w locie format ładowanych rozszerzeń z .h na .hpp,
#
# b) wczytać plik http://datko.pl/SO2/cpp.txt i wyświetlić jego treść, 
#    pomijając przy tym wszystkie znaczniki języka HTML (włącznie z atrybutami! <p class=”a”>tekst</p> → tekst),
#
# c) wczytać plik http://datko.pl/SO2/tox.ini i odnaleźć wszystkie definicje zmiennych w kluczach setenv
#    – wyświetlić jakie unikalne nazwy pojawiają się w pliku,
#
# d) wyposażyć skrypt w rozsądną obsługę błędów, takich jak na przykład nieistniejące pliki wejściowe.

wget http://datko.pl/SO2/qemu-io.c -O "a.txt"

awk '{
        for(i=1;i<=NF;i++)
        {
            if($i ~ /\.h[>|"]/)
            {
                temp = gensub ("\.h", "\.hpp", "g", $i);
                print temp
            }
            else
            {
                print $i
            }
        }
    }' a.txt