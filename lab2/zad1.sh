#!/bin/bash

if [ ! -d ${1} ]
then
	echo "Directory $1 doesn't exist" 
else
	for file in $1/* #`ls $1`
	do
		if [ -w $file ]
		then
			mv  ${1}/${file} ${1}/${file}.old
		else
			echo "Brak prawa dostepu do $file"
		fi
	done
fi
