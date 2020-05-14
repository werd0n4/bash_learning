#!/bin/bash
#Filip Gajewski 236597
#
#Napisz skrypt który:
# pobierze i rozpakuje źródła Linuksa, jeśli trzeba (strona kernel.org, wget oraz tar -xf)  <---
#
# zliczy (wc), ile źródła Linuksa zawierają plików, katalogów, dowiązań, itp. <----
#
# poda jaką część wszystkich plików źródłowych stanowią pliki o rozszerzeniu .asm, .c, .cpp, itp. <---
#
# zliczy ile jest plików niepustych, o rozmiarze mniejszym niż 1MB  <--

linuxtar=linux-5.6.4.tar.xz
linux=linux-5.6.4

#wget https://cdn.kernel.org/pub/linux/kernel/v5.x/$linuxtar
#tar -xf ./$linuxtar

echo Źródła Linuksa zawierają
echo Plików:
all=$(find ./$linux -type f -print | wc -l)
echo $all
echo Katalogów:
find ./$linux -type d -print | wc -l
echo Dowiązań:
find ./$linux -type l -print | wc -l

echo Pliki o rozszerzeniu .asm, .c, .cpp stanowią wszystkich plików:
cpp=$(find ./$linux -type f -name "*.asm" -o -name "*.c" -o -name "*.cpp" | wc -l)
output=$(bc <<< "scale=2 ; ($cpp/$all)*100")
echo $output%

echo Pliki niepuste o rozmiarze mniejszym niż 1MB: 
find ./$linux ! -empty -size -1048576c -print | wc -l