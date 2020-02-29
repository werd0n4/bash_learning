#!/bin/bash

for item in $1/*
do
	if [ ! -x $item -a -f $item ]
	then
		rm $item
	elif [ ! -x $item -a -d $item -a -z "$(ls -A $item)" ]
	then
		rm -r $item
	fi
done
