#!/bin/bash

files=(../resources/cutout/$1/*)
file=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
magick composite -gravity southeast $file -geometry x$(($3 * 99 / 100))+$(($2 / 100)) ../resources/flag/$1/$2x$3.png output1.png
#magick composite -gravity southeast $file -geometry x$(($5 * 99 / 100))+$(($4 / 100)) ../resources/flag/$1/$4x$5.png output2.png
feh --bg-center output1.png
