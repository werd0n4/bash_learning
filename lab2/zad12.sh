#!/bin/bash

files=$(find "$1"/* -maxdepth 0 -perm -u=w -type f | wc -l)
directories=$(find "$1"/* -maxdepth 0 -perm -u=w -type d | wc -l)

echo "Plikow: ""$files"
echo "Katalogow: ""$directories"
