define(`fbg', `rgba(background, focused)')dnl
define(`ubg', `rgba(background, unfocused)')dnl
define(`pcolor', `rgba(primary, 100)')dnl
define(`scolor', `rgba(secondary, 100)')dnl
define(`icolor', `rgba(indicator, 100)')dnl

changecom(`/*', `*/')dnl
# class                   border  backgr. text      indicator child_border
`client.focused'          fbg     fbg     pcolor    icolor    pcolor 
`client.focused_inactive' ubg     ubg     scolor    icolor    scolor  
`client.unfocused'        ubg     ubg     scolor    icolor    scolor   
`client.urgent'           icolor  fbg     iclor     icolor    icolor
`client.placeholder'      pcolor  pcolor  icolor    icolor    pcolory

`client.background'       `#ffffff'
dnl
undefine(`fbg')dnl
undefine(`ubg')dnl
