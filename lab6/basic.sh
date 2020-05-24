#! /bin/bash
#Filip Gajewski 236597
#
#
# Napisz skrypt, który będzie się zachowywał jak własna wariacja na temat programu wc.
# Mianowicie, dla zadanego pliku (argument wywołania skryptu) powinien on wygenerować na ekranie statystykę,
# składającą się z trzech liczb: 
# - liczby wszystkich liter w podanym pliku, 
# - liczbę słów w danym pliku
# - oraz liczbę linii w danym pliku.

awk '
    {
        words += NF;
        lines = NR;
        data = gensub ("[ \t]", "", "g");
        len[$0] = length(data);
    }
    END {
            for (val in len)
                letters+=len[val];
            print "Letters: " letters;
            print "Words: " words;
            print "Lines: " lines
        }
    ' $1