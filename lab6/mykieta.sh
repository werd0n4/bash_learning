#! /bin/bash

if [ "$#" -lt 1 ]
then
		echo "Podano zbyt mało argumentów skryptu"
			exit 1
		elif [ ! -f "$1" ]
		then
				echo "Argument 1 powinien być istniejacym plikiem"
					exit 1
fi

awk '\
	{ nocommentline = gensub (/\/\/.*$/, "", "g");
		dateschanged  = gensub(/([0-9]{2})\-([0-9]{2})\-[0-9]{2}([0-9]{2})/, "\\3/\\2/\\1", "g", nocommentline);
		if (match (dateschanged, /^[ ]*#include[ ]*<([^> ]+)>[ ]*$/, fname) == 0 )
			match (dateschanged, /^[ ]*#include[ ]*"([^" ]+)"[ ]*$/, fname);
			if (1 in fname) filenames[fname[1]] = fname[1];
				print NR, dateschanged }
				END { for (i in filenames) printf("%s\n", filenames[i])}' "$1"

