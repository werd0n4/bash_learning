#! /bin/bash
#Filip Gajewski 236597
#
# Proszę napisać pobieracz wszystkich obrazków z podanej strony internetowej. Niech skrypt:
# a) wyciągnie kod źródłowy strony z podanego adresu www (parametr wywołania skryptu), używając na przykład komendy wget -qO- <adres>
# b) wyszuka wszystkie adresy obrazków, występujących w kodzie strony (możemy założyć, że rozpoznajemy obrazki po rozszerzeniach plików gif, png i jpeg)
# c) skonstruuje poprawne bezwzględne adresy do znalezionych obrazków i zapisze je (te adresy) w jakimś pliku
# d) jeśli w kodzie strony znajdują się pliki css, przeanalizować analogicznie ich zawartość oraz pobrać zdefiniowane tam pliki z obrazkami

site="${1:-https://jbzd.com.pl/}"

wget -qO- $site | awk '{
    for(i=1;i<=NF;i++)
    {
        if($i ~ /[a-zA-Z0-9\.:\/\-\\_]*\.(jpg|JPG|gif|GIF|png|PNG)/)
        {
            match($i, /[a-zA-Z0-9\.:\/\-\\_]*\.(jpg|JPG|gif|GIF|png|PNG)/, img);
            print img[0]           
        }
    }
}' > output.txt

