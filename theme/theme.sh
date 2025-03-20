#! /bin/sh

cd /home/stone/git/arch-setup/theme

cp ./.theme/$1.m4 theme.m4
cp ./.platform/$2.m4 platform.m4

mkdir -p ~/.config/i3/
m4 i3/template.m4 -I i3/ -I lib/ > ~/.config/i3/config

mkdir -p ~/.config/alacritty
m4 alacritty/template.m4 -I alacritty/ -I lib/ > ~/.config/alacritty/\
alacritty.toml

mkdir -p ~/.config/polybar
m4 polybar/template.m4 -I polybar/ -I lib/ > ~/.config/polybar/\
config.ini

mkdir -p ~/.config/dunst/dunstrc.d/
m4 dunst/base.m4 -I dunst/ -I lib/ > ~/.config/dunst/dunstrc
m4 dunst/colors.m4 -I dunst/ -I lib/ > ~/.config/dunst/dunstrc.d/50-colors.conf

./background.sh $1 1920 1080 1600 900
wal -f .theme/$1.json
pywal-discord -p ~/.config/vesktop/themes/
pywalfox update
i3-msg reload
polybar-msg cmd restart
killall dunst

rm theme.m4
rm platform.m4

notify-send -i ~/git/arch-setup/theme/output.png 'Succesfully switched to the '$1' theme!'
