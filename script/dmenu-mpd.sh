#! /bin/sh

artist=$(mpc list AlbumArtist | dmenu)
if [ "$artist" = "" ]; then
    mpc clear
    mpc add /
else
    album=$(mpc list Album AlbumArtist "$artist" | dmenu)
    if [ "$album" = "" ]; then
        mpc clear
        mpc searchadd AlbumArtist "$artist"
    else
        song=$(mpc list Title AlbumArtist "$artist" Album "$album" | dmenu)
        mpc clear
        if [ "$song" = "" ]; then
            mpc searchadd AlbumArtist "$artist" Album "$album"
        else
            mpc searchadd AlbumArtist "$artist" Album "$album" Title "$song"
        fi
    fi
fi
mpc play
