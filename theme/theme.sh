#! /bin/sh

cd /home/stone/git/arch-setup/theme

cp ./.theme/$1.m4 theme.m4
cp ./.platform/$2.m4 platform.m4

m4 i3/template.m4 -I i3/ -I lib/ > ../config/.config/i3/config

m4 alacritty/template.m4 -I alacritty/ -I lib/ > ../config/.config/alacritty/\
alacritty.toml

m4 polybar/template.m4 -I polybar/ -I lib/ > ../config/.config/polybar/\
config.ini

m4 dunst/base.m4 -I dunst/ -I lib/ > ../config/.config/dunst/dunstrc
m4 dunst/colors.m4 -I dunst/ -I lib/ > ../config/.config/dunst/dunstrc.d/50-colors.conf

wal -nf .theme/$1.json
pywal-discord
pywalfox update
i3-msg reload
polybar-msg cmd restart
./background.sh $1 1920 1080 1600 900
killall dunst

rm theme.m4
rm platform.m4

notify-send -i ~/git/arch-setup/theme/output1.png 'Succesfully switched to the '$1' theme!'
