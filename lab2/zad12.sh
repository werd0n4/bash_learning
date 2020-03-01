#!/bin/bash

files=`ls $1 -l | grep -c -- -.w`
directories=`ls $1 -l | grep -c d.w`

echo "Plikow: "$files
echo "Katalogow: "$directories