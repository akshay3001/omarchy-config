# Omarchy config reference

Saved on 2026-10-02 from this machine's active user config.
Only files that differ from the installed Omarchy config templates are included.
The files are exact copies, including the template comments.

The `.config/` paths match the paths under `~/.config/`.
These files use the current Lua-based Hyprland config. The previous `.conf`
files in this repo were removed. Git history keeps the previous repo contents.

## Saved changes

| File | Changes |
| --- | --- |
| `.config/hypr/bindings.lua` | Mac-style app shortcuts, clipboard access, YouTube Music, and mouse bindings. |
| `.config/hypr/input.lua` | Alt/Super swap, touchscreen disabled, touchpad settings, and workspace gestures. |
| `.config/hypr/looknfeel.lua` | Inner gaps of 2 and outer gaps of 4. |
| `.config/hypr/monitors.lua` | Monitor scale of 1.6 and GDK scale of 2. |
| `.config/omarchy/shell.json` | 12-hour clock with AM/PM and a Tailscale bar item. |
| `.config/ghostty/config` | Font size of 11. |

## Shortcuts

Super is beside the spacebar after the Alt/Super swap.
App shortcuts forward keys to the focused app, so behavior depends on the app.

| Shortcut | Action |
| --- | --- |
| Super+Q | Close window. |
| Super+T | New tab. |
| Super+Shift+T | Reopen closed tab. |
| Super+W | Close tab. |
| Super+L | Address bar. |
| Super+R | Reload. |
| Super+F | Find in the focused app. |
| Ctrl+F | Toggle full screen. |
| Super+Shift+P | Command palette. |
| Super+Shift+M | Open YouTube Music. |
| Super+Shift+V | Open clipboard manager. |
| Super+Shift+C | Send Alt+Shift+L to Chrome/Chromium to copy the browser URL. |
| Alt+Left / Alt+Right | Move by word. |
| Alt+Backspace | Delete the previous word. |
| Super+Backspace | Select to line start with two Shift+Home presses, then delete. |
| Super+Z | Undo. |
| Super+A | Select all. |
| Super+left click | Send Ctrl+left click. |
| Super+Alt+left drag | Move window. |

Default launch shortcuts for ChatGPT, Grok, HEY Calendar, HEY Email,
WhatsApp, and Google Messages are disabled. Super+Shift+C is reused above.

## Input settings

- Three-finger horizontal swipe changes workspace.
- Touchscreen input and tap-to-click are disabled.
- Natural scrolling is disabled. Touchpad scroll factor is 0.2.
- Built-in trackpad pointer sensitivity is 0.1.
- Workspace swipe inversion is disabled. Distance is 200, cancel ratio is
  0.35, and minimum speed to force a change is 10.
- Caps Lock remains the Compose key.

## Use this copy

Compare a saved file with the current user file before restoring it, for example:

```sh
diff -u ~/.config/hypr/bindings.lua .config/hypr/bindings.lua
```

Back up the current user file, then copy the selected saved file to the same
path under `~/.config/`. Restore only the files you need.
The installed `hyprland.lua` must load the `hypr.monitors`, `hypr.input`,
`hypr.bindings`, and `hypr.looknfeel` modules after Omarchy defaults.
These files also require the Omarchy Lua helpers `hl` and `o`.

After restoring Hyprland files, check the config:

```sh
hyprctl reload
hyprctl configerrors
```

The shell reloads `shell.json` on save. Use `omarchy restart terminal`
to apply terminal config changes.
