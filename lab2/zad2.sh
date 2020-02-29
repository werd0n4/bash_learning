#!/bin/bash

for name in `cat $2`
do
	touch $1/$name
done
