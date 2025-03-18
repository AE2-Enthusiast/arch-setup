 # This file is part of my Arch Linux setup scripts
 # Copyright (C) 2023 Stone
 # 
 # This program is free software: you can redistribute it and/or
 # modify
 # it under the terms of the GNU General Public License as published
 # by the Free Software Foundation, either version 3 of the License,
 # or (at your option) any later version.
 # 
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.

# Links everything in the .config folder into the default XDG config folder

xdgConfigPath=$(realpath ../config/.config)
ln -sv -t ~/.config/ "$xdgConfigPath"/*
ln -sv $(realpath ../resources/shaders) ../config/.config/ghostty/shaders
mkdir -p ~/.local/share/fonts
ln -sv -t ~/.local/share/fonts/ $(realpath ../resources/fonts)/*

homeConfigPath=$(realpath ../config/home)
IFS='
'
homeConfigs=$(\ls -A1 $homeConfigPath)

for path in $homeConfigs
do
    #echo $homeConfigPath/$path
    ln -sv -t ~/ $homeConfigPath/$path
done
unset $IFS
