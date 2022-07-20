#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# settings/daemons
setxkbmap -layout us,gr -option grp:shifts_toggle
xsetroot -cursor_name left_ptr &
# lxsession &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
udiskie &
dunst &
dbar2 &
$HOME/.fehbg &

# exec killall ssh-agent
# exec killall lxclipboard
#mpv --input-ipc-server=/tmp/mpvcontrol --idle --no-video --no-terminal &
#nitrogen --restore

# picom --no-fading-openclose -I 1 -O 1 -b

# execs

# exec bspwm
# exec qtile
# exec cinnamon-session
# exec xfce4-session
# exec openbox-session
exec dwm
# exec spectrwm
# exec gnome-shell
