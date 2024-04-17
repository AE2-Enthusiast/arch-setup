alias ls='ls -lah'

function open () {
    xdg-open "$@" > $(mktemp /tmp/open-XXXX.log) & disown $!
}

(cat ~/.cache/wal/sequences &)

source ~/.profile
