#!/bin/bash

files=(../resources/backgrounds/$1/*)
printf "%s\n" "${files[RANDOM % ${#files[@]}]}"
