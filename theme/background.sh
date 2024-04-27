#!/bin/bash

files=(../resources/cutout/$1/*)
file=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
magick composite -gravity southeast $file -geometry x1048+32 ../resources/flag/$1.png output.png
echo output.png
