alias ls='ls -lah'
function open () {
    xdg-open $@ & disown
    }
