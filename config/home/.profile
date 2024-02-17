alias ls='ls -lah'
function open () {
    xdg-open "$@" > $(mktemp open-XXXX.log) & disown
}
