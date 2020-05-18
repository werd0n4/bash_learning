#! /bin/bash
#Filip Gajewski 236597
#
# Zabawy z komendą ps --no-header -ewwo user,pcpu,command. Niech skrypt:
# a) wyświetli 10 procesów, które najbardziej obciążają procesor
# b) policzy, ile procesów należy do poszczególnych użytkowników systemu
# c) zamieni wielokrotne wystąpienia spacji na pojedyncze ich wystąpienia
# d) zliczy, ile unikalnych programów jest uruchomionych w systemie 
#    (zakładamy najprościej, że program1, /jakiś/program1 oraz /jakiś/program1 --jakaś-opcja 
#    to dwa unikalne działające programy: program1 oraz /jakiś/program1)

#A
printf "\n====PODPUNKT A====\n"
ps --no-header -ewwo user,pcpu,command | sort -nrk2 | head

#B
printf "\n====PODPUNKT B====\n"
ps --no-header -ewwo user,pcpu,command | sort -nrk2 | head | sort -k1 | cut -d' ' -f1 -s | uniq -c

#C
printf "\n====PODPUNKT C====\n"
ps --no-header -ewwo user,pcpu,command | sort -nrk2 | head | tr -s ' '

#D
printf "\n====PODPUNKT D====\n"
ps --no-header -ewwo user,pcpu,command | sort -nrk2 | head | tr -s ' ' | sort -k3 | cut -d' ' -f3 | uniq -c
