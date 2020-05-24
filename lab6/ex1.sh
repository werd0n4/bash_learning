#! /bin/bash
#
#Dany jest plik zwykły P (argument skryptu). Należy wypisać ten plik na 
#ekran z następującymi zmianami (tylko wypisać, 
#bez zmiany oryginalnego pliku):

#1. Ponumerować linie pliku (puste też). (1)
#2. Nie wypisywać treści komentarzy jednolinijkowych C/C++ 
#(pomijać treść od dwuznaku // do końca linii). (2)
#3. Zamienić wszystkie daty formatu DD-MM-YYYY (np. 30-04-2020) na 
#YY/MM/DD (20/04/30). Uwaga: daty mogą występować wielokrotnie 
#w tej samej linii! (4)
#4. Na koniec wypisać nazwy załączonych plików C/C++ (wykrywanie linii 
#typu #include <filename> lub #include "filename"). (3)

if [ $# -eq 0 ]; then
    ./create_cpp_file.sh
fi

file="${1:-main.cpp}"


awk '/\/\// {next}
    {
        data = gensub ("([0-9]{2})-([0-9]{2})-[0-9]{2}([0-9]{2})", "\\3/\\2/\\1", "g");
        print NR ". " data
    }
    /include/ {lib = gensub("[\"<>]", "", "g", $2); includes[lib]}
    END {for (val in includes) print val}' $file
