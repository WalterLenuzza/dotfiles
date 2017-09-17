file.content "xinitrc" {
  destination = "{{param `prefix`}}/.xinitrc"

  content = <<EOF
#!/usr/bin/env sh

# Source ~/.config/xorg/Xprofile first
[ -f '{{param `prefix`}}/.config/xorg/Xprofile' ] && \
  . '{{param `prefix`}}/.config/xorg/Xprofile'

# Set bspwm as default
session=${1:-bspwm}

case $session in
  awesome           ) exec awesome;;
  bspwm             ) exec bspwm;;
  catwm             ) exec catwm;;
  cinnamon          ) exec cinnamon-session;;
  dwm               ) exec dwm;;
  enlightenment     ) exec enlightenment_start;;
  ede               ) exec startede;;
  fluxbox           ) exec startfluxbox;;
  gnome             ) exec gnome-session;;
  gnome-classic     ) exec gnome-session --session=gnome-classic;;
  i3|i3wm           ) exec i3;;
  icewm             ) exec icewm-session;;
  jwm               ) exec jwm;;
  kde               ) exec startkde;;
  mate              ) exec mate-session;;
  monster|monsterwm ) exec monsterwm;;
  notion            ) exec notion;;
  openbox           ) exec openbox-session;;
  unity             ) exec unity;;
  xfce|xfce4        ) exec startxfce4;;
  xmonad            ) exec xmonad;;
  # No known session, try to run it as command
  *) exec "$1";;
esac

EOF
}

file.content "xprofile" {
  destination = "{{param `prefix`}}/.config/xorg/Xprofile"

  content = <<EOF
#!/usr/bin/env sh

# Merge Xresources
[ -f '{{param `prefix`}}/.config/xorg/Xresources' ] && \
  command -v xrdb >/dev/null 2>&- && \
  xrdb '{{param `prefix`}}/.config/xorg/Xresources'

# Merge Xdefaults
[ -f '{{param `prefix`}}/.config/xorg/Xdefaults' ] && \
  command -v xrdb >/dev/null 2>&- && \
  xrdb -merge '{{param `prefix`}}/.config/xorg/Xdefaults'

# Run composite manager (Compton)
[ -f '{{param `prefix`}}/.config/compton/config' ] && \
  command -v compton >/dev/null 2>&- && \
  compton --config '{{param `prefix`}}/.config/compton/config' -bc

# Set wallpaper (Feh)
[ -f '{{param `prefix`}}/.local/share/wallpaper' ] && \
  command -v feh >/dev/null 2>&- && \
  feh --bg-max '{{param `prefix`}}/.local/share/wallpaper'

EOF
}

task "xresources" {
  depends = ["file.content.xresources"]
  check   = "readlink {{param `prefix`}}/.Xresources"
  apply   = "ln -sf {{param `prefix`}}/.config/xorg/Xresources {{param `prefix`}}/.Xresources"
}

file.content "xresources" {
  destination = "{{param `prefix`}}/.config/xorg/Xresources"

  content = <<EOF
! -----------------------------------------------------------------------------
! File: Xresources
! -----------------------------------------------------------------------------

! HiDPI
*.dpi:   192
*.depth:  32
*.utf8:    1

! Colors
! black:    color0 - color8
! red:      color1 - color9
! green:    color2 - color10
! yellow:   color3 - color11
! blue:     color4 - color12
! magenta:  color5 - color13
! cyan:     color6 - color14
! white:    color7 - color15

*.color0:  #282828
*.color1:  #cc241d
*.color2:  #98971a
*.color3:  #d79921
*.color4:  #458588
*.color5:  #b16286
*.color6:  #689d6a
*.color7:  #a89984
*.color8:  #928374
*.color9:  #fb4934
*.color10: #b8bb26
*.color11: #fabd2f
*.color12: #83a598
*.color13: #d3869b
*.color14: #8ec07c
*.color15: #ebdbb2

*.background:  #282828
*.foreground:  #a89984
*.cursorColor:  #a89984

! Fonts
*.font:           Anonymice Nerd Font:size=11:antialias=true:autohint=true
*.boldFont:       Anonymice Nerd Font:size=11:antialias=true:autohint=true:style:Bold
*.italicFont:     Anonymice Nerd Font:size=11:antialias=true:autohint=true:style:Italic
*.boldItalicFont: Anonymice Nerd Font:size=11:antialias=true:autohint=true:style:ItalicBold

! XFT fonts
Xft.antialias: 1
Xft.autohint: 1
Xft.hintstyle:  hintfull
Xft.hinting: 1
Xft.lcdfilter:  lcddefault
Xft.rgba: rgb


! -----------------------------------------------------------------------------
! URxvt Xresources

!*saveLines:             99999
!*faceSize:              10
!*bellIsUrgent:          true

! Terminal Name
URxvt*.termName: xterm-256color

URxvt.font:           xft:Anonymice Nerd Font:size=11
URxvt.boldFont:       xft:Anonymice Nerd Font:size=11,style:Bold
URxvt.italicFont:     xft:Anonymice Nerd Font:size=11,style:Italic
URxvt.boldItalicFont: xft:Anonymice Nerd Font:size=11,style:ItalicBold

! Disable scrollbar
URxvt*scrollBar: false

! do not scroll with output
URxvt*scrollTtyOutput: false

! scroll in relation to buffer (with mouse scroll or Shift+Page Up)
URxvt*scrollWithBuffer: true

! scroll back to the bottom on keypress
URxvt*scrollTtyKeypress: true

! scrollback buffer
URxvt.secondaryScreen:  1
URxvt.secondaryScroll:  0
URxvt.secondaryWheel:   1

! copy paste
URxvt*clipboard.copycmd:    xclip -i -selection clipboard
URxvt*clipboard.pastecmd:   xclip -o -selection clipboard

! disable default bindings for Control-Shift
URxvt.iso14755: false
URxvt.iso14755_52: false

! Control-Shift-C for copy
!URxvt.keysym.C-C: perl:clipboard:copy
!URxvt.keysym.C-V: perl:clipboard:paste

! get option over to work
URxvt.keysym.M-Left:        \033[1;5D
URxvt.keysym.M-Right:       \033[1;5C
URxvt.keysym.Control-Left:  \033[1;5D
URxvt.keysym.Control-Right: \033[1;5C

! URL launcher mod+lclick
URxvt.perl-ext-common:      default,matcher,selection-to-clipboard
URxvt.url-launcher:         /usr/bin/xdg-open
URxvt.matcher.button:       1
URxvt.url-select.underline: true
EOF
}
