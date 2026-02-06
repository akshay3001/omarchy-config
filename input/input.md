# Input setup

```conf
# Control your input devices
# See https://wiki.hypr.land/Configuring/Variables/#input
input {
  # Use multiple keyboard layouts and switch between them with Left Alt + Right Alt
  # kb_layout = us,dk,eu
  kb_layout = us
  kb_options = compose:caps # ,grp:alts_toggle

  # Change speed of keyboard repeat
  repeat_rate = 40
  repeat_delay = 600

  # Start with numlock on by default
  numlock_by_default = true

  # Increase sensitity for mouse/trackpack (default: 0)
  sensitivity = 0.1

  touchpad {
    # Use natural (inverse) scrolling
    # natural_scroll = true

    # Use two-finger clicks for right-click instead of lower-right corner
    # clickfinger_behavior = true

    # Tapping on the touchpad with 1, 2, or 3 fingers will send LMB, RMB, and MMB respectively
    tap-to-click = false

    # Control the speed of your scrolling
    scroll_factor = 0.3

    # Button presses with 1, 2, or 3 fingers will be mapped to LMB, RMB, and MMB respectively
    clickfinger_behavior = true
 }
}

gestures {
  gesture = 3, horizontal, workspace
  workspace_swipe_invert = false
}

# Scroll faster in the terminal
windowrule = scrolltouchpad 1.5, tag:terminal

# Enable touchpad gestures for changing workspaces
# See https://wiki.hyprland.org/Configuring/Gestures/
# gesture = 3, horizontal, workspace·

```
