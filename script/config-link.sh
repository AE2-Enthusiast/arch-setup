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

configPath=$(realpath ../config/.config)
ln -sfv -t ~/.config/ "$configPath"/*
