include(`color.m4')dnl
include(`theme.m4')dnl
dnl
[global]
  # Defines color of the frame around the notification window.
  frame_color = "rgb(primary)"
  `background =' "rgba(background, focused)"

[urgency_low]
    # IMPORTANT: colors have to be defined in quotation marks.
    # Otherwise the "#" and following would be interpreted as a comment.
    `foreground =' "`#'888888"
    timeout = 10
    # Icon for notifications with low urgency, uncomment to enable
    #default_icon = /path/to/icon

[urgency_normal]
    `foreground =' "#ffffff"
    timeout = 10
    # Icon for notifications with normal urgency, uncomment to enable
    #default_icon = /path/to/icon

[urgency_critical]
    `foreground =' "`#'ffffff"
    frame_color = "`#'ff0000"
    timeout = 0
    # Icon for notifications with critical urgency, uncomment to enable
    #default_icon = /path/to/icon
