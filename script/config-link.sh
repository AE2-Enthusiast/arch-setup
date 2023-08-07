# Linkes everything in the .config folder into the default XDG config folder
configPath=$(realpath ../config/.config)
ln -sfv -t ~/.config/ "$configPath"/*
