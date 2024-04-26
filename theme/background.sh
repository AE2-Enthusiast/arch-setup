#!/bin/bash
# magick composite -gravity southeast $file.png -geometry x1048+32 ../resources/flags/$1.png output.png
# echo output.png
files=(../resources/backgrounds/$1/*)
file=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
echo $file
