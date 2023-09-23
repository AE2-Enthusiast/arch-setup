#! /bin/sh

cd /home/stone/git/arch-setup/theme

cp $1.m4 theme.m4

m4 i3/template.m4 -I i3/ -I lib/ > ../config/.config/i3/config
m4 alacritty/template.m4 -I alacritty/ -I lib/ > ../config/.config/alacritty/\
alacritty.toml
m4 polybar/template.m4 -I polybar/ -I lib/ > ../config/.config/polybar/config.ini

i3-msg reload
polybar-msg cmd restart
feh --bg-center background/$1.*
