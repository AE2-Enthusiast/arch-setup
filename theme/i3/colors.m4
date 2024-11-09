define(`fbg', `rgba(background, focused)')dnl
define(`ubg', `rgba(background, unfocused)')dnl
define(`pcolor', `rgba(primary, 100)')dnl
define(`scolor', `rgba(secondary, 100)')dnl
define(`icolor', `rgba(indicator, 100)')dnl
dnl
changecom(`/*', `*/')dnl
dnl changequote(`[', `]')dnl
dnl
bindsym $mod+d exec "i3-msg exec $(dmenu_path | dmenu $@ -nf 'rgb(secondary)' -nb 'rgb(background)' -sb 'rgb(background)' -sf 'rgb(primary)' -fn 'monospace-10')"

# class                   border  backgr. text      indicator child_border
`client.focused'          pcolor  fbg     pcolor    icolor    pcolor 
`client.focused_inactive' pcolor  fbg     scolor    icolor    scolor  
`client.unfocused'        scolor  ubg     scolor    icolor    scolor   
`client.urgent'           icolor  fbg     iclor     icolor    icolor
`client.placeholder'      pcolor  pcolor  icolor    icolor    pcolory

`client.background'       `#ffffff'
dnl
undefine(`fbg')dnl
undefine(`ubg')dnl
changecom()dnl
changequote()dnl
