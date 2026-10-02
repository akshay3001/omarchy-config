-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Move the close-window shortcut from Super+W to Super+Q.
hl.unbind("SUPER + W")
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())

-- Forward Mac-style app shortcuts to the focused window. Send key down/up
-- separately so synthetic keys do not remain held.
local function send_key(mods, key, after)
  hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))
  hl.timer(function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
    if after then
      hl.timer(after, { timeout = 10, type = "oneshot" })
    end
  end, { timeout = 50, type = "oneshot" })
end

local function send_shortcut(mods, key)
  return function()
    send_key(mods, key)
  end
end

hl.unbind("SUPER + T") -- was: toggle window floating/tiling
hl.unbind("SUPER + L") -- was: toggle workspace layout

o.bind("SUPER + T", "New tab", send_shortcut("CTRL", "T"))
o.bind("SUPER + SHIFT + T", "Reopen closed tab", send_shortcut("CTRL SHIFT", "T"))
o.bind("SUPER + W", "Close tab", send_shortcut("CTRL", "W"))
o.bind("SUPER + L", "Address bar", send_shortcut("CTRL", "L"))
o.bind("SUPER + R", "Reload", send_shortcut("CTRL", "R"))

hl.unbind("SUPER + SHIFT + P") -- was: Google Photos
o.bind("SUPER + SHIFT + P", "Command palette", send_shortcut("CTRL SHIFT", "P"))

hl.unbind("SUPER + SHIFT + M") -- was: Spotify
o.bind("SUPER + SHIFT + M", "YouTube Music", { webapp = "https://music.youtube.com/" })

-- Remove default shortcuts for web apps no longer installed.
hl.unbind("SUPER + SHIFT + A") -- ChatGPT
hl.unbind("SUPER + SHIFT + ALT + A") -- Grok
hl.unbind("SUPER + SHIFT + C") -- Calendar (HEY)
hl.unbind("SUPER + SHIFT + E") -- Email (HEY)
hl.unbind("SUPER + SHIFT + ALT + E") -- New email (HEY)
hl.unbind("SUPER + SHIFT + ALT + G") -- WhatsApp
hl.unbind("SUPER + SHIFT + CTRL + G") -- Google Messages

o.bind("SUPER + SHIFT + V", "Clipboard manager", "omarchy-shell shell toggle omarchy.clipboard")

-- Copy the URL in Chrome/Chromium.
o.bind("SUPER + SHIFT + C", "Copy browser URL", function()
  local window = hl.get_active_window()
  local class = window and window.class:lower() or ""
  if class == "chromium" or class == "google-chrome" or class:match("^chrome%-") then
    send_key("ALT SHIFT", "L")
  end
end)

hl.unbind("SUPER + BACKSPACE") -- was: toggle window transparency

o.bind("ALT + LEFT", "Word left", send_shortcut("CTRL", "LEFT"))
o.bind("ALT + RIGHT", "Word right", send_shortcut("CTRL", "RIGHT"))
o.bind("ALT + BACKSPACE", "Delete word left", send_shortcut("CTRL", "BACKSPACE"))

-- Two Shift+Home presses reach column zero in editors with smart Home behavior.
local function delete_to_line_start()
  send_key("SHIFT", "HOME", function()
    send_key("SHIFT", "HOME", function()
      send_key("", "BACKSPACE")
    end)
  end)
end

o.bind("SUPER + BACKSPACE", "Delete to line start", delete_to_line_start)

o.bind("SUPER + Z", "Undo", send_shortcut("CTRL", "Z"))
o.bind("SUPER + A", "Select all", send_shortcut("CTRL", "A"))

-- Use Super-click as Ctrl-click in all apps. Move windows with Super+Alt-drag.
hl.unbind("SUPER + mouse:272") -- was: move window
o.bind("SUPER + mouse:272", "Ctrl-click", hl.dsp.send_shortcut({ mods = "CTRL", key = "mouse:272" }))
o.bind("SUPER + ALT + mouse:272", "Move window", hl.dsp.window.drag(), { mouse = true })
