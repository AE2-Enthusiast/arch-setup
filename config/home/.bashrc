alias ls='ls -lah'
alias sl='sl -l16'
export EDITOR=emacs

function open () {
    xdg-open "$@" > $(mktemp /tmp/open-XXXX.log) & disown $!
}

if ! ([ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]); then
    cat ~/.cache/wal/sequences
fi

source ~/.profile
