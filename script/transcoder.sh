#!/bin/bash

# needs aft-mtp-mount, GNU parallel, image magick, ffmpeg, and find to work

# first argument is the folder to mount the phone in, default is ~/android
if [[ -z $1 ]]
then
    phone=$1
else
    mkdir -p ~/android
    phone="~/android/"
fi
aft-mtp-mount $phone

function transcode()
{
file=$2
directory=$1

filename=$(basename -- "$file")
extension="${filename##*.}"
filename="${filename%.*}"
if [[ "$extension" = "png" || "$extension" = "jpg" ]]
then
    # copy over and compress the coverart, Auxio at least picks up on it
    magick "$file" -resize 256 "$directory/albumart.jpg"
else
    # -map 0:0 will pick the first stream (audio always?) only, dropping the
    # video/coverart stream. Needed because in my experience, all the music
    # players freak out over it on oggs.
    ffmpeg -hide_banner -n -i "$file" -map 0:0 -c:a libopus -b:a \
           128K "$directory/$filename.ogg"
fi
}
export -f transcode
IFS=$'\n';
# I suspect this'll break if newlines are in album names. Maybe figure out how
# to use nulls?
for album in $({ find . -type d; echo; } | awk 'index($0,prev"/")!=1 && NR!=1 {print prev} 1 {sub(/\/$/,""); prev=$0}')
do
    directory=${album##./}
    # assuming all Android phone's have the same layout, idk actually
    directory="$phone/Internal shared storage/Music/$directory"
    mkdir -p $directory
    # passes the destination directory/album as the first argument, source
    # files will be the second argument
    # "\"<stuff\"" is because so the quotes show up for the function call,
    # this'll properly escape spaces and such so argument splitting works
    find $album -maxdepth 1 -type f | parallel transcode "\"$directory\""
done
unset IFS;
