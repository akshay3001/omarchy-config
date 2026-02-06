# Keyboard setup and customisations

## keyd configuration

- GitHub discussion - https://github.com/basecamp/omarchy/discussions/175

### Installed keyd

```bash
sudo pacman -S keyd
```

### Create /etc/keyd/default.conf:

```conf
[ids]
*

[main]
# Cmd keys trigger the cmd layer
leftmeta = layer(cmd)
rightmeta = layer(cmd)

# Caps Lock acts as Cmd
capslock = leftmeta

[cmd:C]
# Essential shortcuts
a = C-a          # Select all
c = C-c          # Copy
v = C-v          # Paste
x = C-x          # Cut
z = C-z          # Undo
s = C-s          # Save
f = C-f          # Find
w = C-w          # Close tab
t = C-t          # New tab
q = C-q          # Quit

# Text navigation
left = C-a       # Beginning of line
right = C-e      # End of line
```

### Create ~/.config/keyd/app.conf for terminal-specific overrides:

```conf
# Terminal applications need Ctrl+Shift for copy/paste
[alacritty|kitty|gnome-terminal|konsole]
cmd.c = C-S-c
cmd.v = C-S-v

[com-mitchellh-ghostty]
cmd.c = C-S-c
cmd.v = C-S-v
cmd.t = C-S-t
cmd.w = C-S-w
cmd.leftbrace = C-S-tab
cmd.rightbrace = C-tab
```

### Enable Services

```bash
# Enable keyd
sudo systemctl enable --now keyd

# Set up keyd-application-mapper (user service)
mkdir -p ~/.config/systemd/user/

cat > ~/.config/systemd/user/keyd-application-mapper.service << 'EOF'
[Unit]
Description=Keyd Application Mapper
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/keyd-application-mapper -d
Restart=always

[Install]
WantedBy=default.target
EOF

systemctl --user enable --now keyd-application-mapper
```

---

## bindings.conf overrides

```conf
# Application bindings
$terminal = uwsm app -- $TERMINAL
$browser = omarchy-launch-browser

bindd = SUPER, return, Terminal, exec, $terminal --working-directory="$(omarchy-cmd-terminal-cwd)"
# bindd = SUPER, F, File manager, exec, uwsm app -- nautilus --new-window
bindd = SUPER, B, Browser, exec, $browser
bindd = SUPER SHIFT, B, Browser (private), exec, $browser --private
# bindd = SUPER, M, Music, exec, omarchy-launch-or-focus spotify
# bindd = SUPER, N, Editor, exec, omarchy-launch-editor
bindd = SUPER, T, Activity, exec, $terminal -e btop
# bindd = SUPER, D, Docker, exec, $terminal -e lazydocker
# bindd = SUPER, G, Signal, exec, omarchy-launch-or-focus signal "uwsm app -- signal-desktop"
# bindd = SUPER, O, Obsidian, exec, omarchy-launch-or-focus obsidian "uwsm app -- obsidian -disable-gpu --enable-wayland-ime"
# bindd = SUPER, slash, Passwords, exec, uwsm app -- 1password

# If your web app url contains #, type it as ## to prevent hyperland treat it as comments
bindd = SUPER, A, ChatGPT, exec, omarchy-launch-webapp "https://chatgpt.com"
# bindd = SUPER SHIFT, A, Grok, exec, omarchy-launch-webapp "https://grok.com"
# bindd = SUPER, C, Calendar, exec, omarchy-launch-webapp "https://app.hey.com/calendar/weeks/"
# bindd = SUPER, E, Email, exec, omarchy-launch-webapp "https://app.hey.com"
bindd = SUPER, Y, YouTube, exec, omarchy-launch-or-focus-webapp YouTube "https://youtube.com/"
# bindd = SUPER SHIFT, G, WhatsApp, exec, omarchy-launch-or-focus-webapp WhatsApp "https://web.whatsapp.com/"
# bindd = SUPER ALT, G, Google Messages, exec, omarchy-launch-or-focus-webapp "Google Messages" "https://messages.google.com/web/conversations"
bindd = SUPER, X, X, exec, omarchy-launch-webapp "https://x.com/"
# bindd = SUPER SHIFT, X, X Post, exec, omarchy-launch-webapp "https://x.com/compose/post"

# Overwrite existing bindings, like putting Omarchy Menu on Super + Space
# unbind = SUPER, SPACE
# bindd = SUPER, SPACE, Omarchy menu, exec, omarchy-menu

# # tiling.conf

# # Close windows
bindd = CTRL, Q, Close active window, killactive,

# # Control tiling
bindd = CTRL, J, Toggle split, togglesplit, # dwindle
# bindd = SUPER, P, Pseudo window, pseudo, # dwindle
# # bindd = SUPER, V, Toggle floating, togglefloating,
# bindd = SHIFT, F11, Force full screen, fullscreen, 0
# bindd = ALT, F11, Full width, fullscreen, 1

# # Move focus with SUPER + arrow keys
# bindd = SUPER, left, Move focus left, movefocus, l
# bindd = SUPER, right, Move focus right, movefocus, r
# bindd = SUPER, up, Move focus up, movefocus, u
# bindd = SUPER, down, Move focus down, movefocus, d

# # Switch workspaces with SUPER + [0-9]
bindd = CTRL, code:10, Switch to workspace 1, workspace, 1
bindd = CTRL, code:11, Switch to workspace 2, workspace, 2
bindd = CTRL, code:12, Switch to workspace 3, workspace, 3
bindd = CTRL, code:13, Switch to workspace 4, workspace, 4
bindd = CTRL, code:14, Switch to workspace 5, workspace, 5
bindd = CTRL, code:15, Switch to workspace 6, workspace, 6
bindd = CTRL, code:16, Switch to workspace 7, workspace, 7
bindd = CTRL, code:17, Switch to workspace 8, workspace, 8
bindd = CTRL, code:18, Switch to workspace 9, workspace, 9
bindd = CTRL, code:19, Switch to workspace 10, workspace, 10

# # Move active window to a workspace with SUPER + SHIFT + [0-9]
bindd = CTRL SHIFT, code:10, Move window to workspace 1, movetoworkspace, 1
bindd = CTRL SHIFT, code:11, Move window to workspace 2, movetoworkspace, 2
bindd = CTRL SHIFT, code:12, Move window to workspace 3, movetoworkspace, 3
bindd = CTRL SHIFT, code:13, Move window to workspace 4, movetoworkspace, 4
bindd = CTRL SHIFT, code:14, Move window to workspace 5, movetoworkspace, 5
bindd = CTRL SHIFT, code:15, Move window to workspace 6, movetoworkspace, 6
bindd = CTRL SHIFT, code:16, Move window to workspace 7, movetoworkspace, 7
bindd = CTRL SHIFT, code:17, Move window to workspace 8, movetoworkspace, 8
bindd = CTRL SHIFT, code:18, Move window to workspace 9, movetoworkspace, 9
bindd = CTRL SHIFT, code:19, Move window to workspace 10, movetoworkspace, 10

# # Tab between workspaces
# bindd = SUPER, TAB, Next workspace, workspace, e+1
# bindd = SUPER SHIFT, TAB, Previous workspace, workspace, e-1
# bindd = SUPER CTRL, TAB, Former workspace, workspace, previous

# # Swap active window with the one next to it with SUPER + SHIFT + arrow keys
bindd = CTRL SHIFT, left, Swap window to the left, swapwindow, l
bindd = CTRL SHIFT, right, Swap window to the right, swapwindow, r
bindd = CTRL SHIFT, up, Swap window up, swapwindow, u
bindd = CTRL SHIFT, down, Swap window down, swapwindow, d

# # Cycle through applications on active workspace
# bindd = ALT, Tab, Cycle to next window, cyclenext
# bindd = ALT SHIFT, Tab, Cycle to prev window, cyclenext, prev
# bindd = ALT, Tab, Reveal active window on top, bringactivetotop
# bindd = ALT SHIFT, Tab, Reveal active window on top, bringactivetotop

# # Resize active window
# bindd = SUPER, code:20, Expand window left, resizeactive, -100 0    # - key
# bindd = SUPER, code:21, Shrink window left, resizeactive, 100 0     # = key
# bindd = SUPER SHIFT, code:20, Shrink window up, resizeactive, 0 -100
# bindd = SUPER SHIFT, code:21, Expand window down, resizeactive, 0 100

# # Move/resize windows with mainMod + LMB/RMB and dragging
# bindmd = SUPER, mouse:272, Move window, movewindow
# bindmd = SUPER, mouse:273, Resize window, resizewindow

# Screenshots
bindd = ALT SHIFT, P, Screenshot of region, exec, omarchy-cmd-screenshot
bindd = ALT, P, Screenshot of window, exec, omarchy-cmd-screenshot window

# # Utilities.conf

# # Menus
bindd = CTRL, SPACE, Launch apps, exec, walker -p "Start…"
# bindd = SUPER CTRL, E, Emoji picker, exec, walker -m Emojis
bindd = CTRL ALT, SPACE, Omarchy menu, exec, omarchy-menu
bindd = CTRL, ESCAPE, Power menu, exec, omarchy-menu system
# bindld = , XF86PowerOff, Power menu, exec, omarchy-menu system
# bindd = SUPER, K, Show key bindings, exec, omarchy-menu-keybindings
# bindd = , XF86Calculator, Calculator, exec, gnome-calculator

# # Aesthetics
# bindd = SUPER SHIFT, SPACE, Toggle top bar, exec, omarchy-toggle-waybar
# bindd = SUPER, BACKSPACE, Toggle window transparency, exec, hyprctl dispatch setprop "address:$(hyprctl activewindow -j | jq -r '.address')" opaque toggle

```
