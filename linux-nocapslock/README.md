# find current keyboard settings
> setxkbmap -print

# files located in
/usr/share/x11/xkb

# remap pc105 keyboard
edit /usr/share/X11/xkb/symbols/pc
```
- key <CAPS> {        [ Caps_Lock             ]       };
+ key <CAPS> {        [ Escape                ]       };
```

# reload keymap
> setxkbmap -layout us



