alias ls='ls -lah'

function open () {
    xdg-open "$@" > $(mktemp /tmp/open-XXXX.log) &
}

(cat ~/.cache/wal/sequences &)
