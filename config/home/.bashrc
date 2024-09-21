alias ls='ls -lah'
alias sl='sl -l16'
export EDITOR=emacs

function open () {
    xdg-open "$@" > $(mktemp /tmp/open-XXXX.log) & disown $!
}

(cat ~/.cache/wal/sequences &)

source ~/.profile
