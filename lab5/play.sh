#! /bin/bash

dir=$1

# 10 jest domyslne
number=${2:-10}

find $dir -type f -printf '%s bytes. Path: %p\n' | sort -nr | head -$number