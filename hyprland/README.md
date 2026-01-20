# Hyprland Setup

## Installed Apps

| App | Purpose | Install |
|-----|---------|---------|
| hyprland | Window manager | `sudo dnf install hyprland` |
| waybar | Status bar | `sudo dnf install waybar` |
| wofi | App launcher | `sudo dnf install wofi` |
| kitty | Terminal | `sudo dnf install kitty` |
| swww | Wallpaper daemon | `sudo dnf install swww` |
| waypaper | Wallpaper GUI | `sudo dnf install waypaper` |
| nautilus | File manager | `sudo dnf install nautilus` |
| hypridle | Idle daemon | `sudo dnf install hypridle` |

## Config Locations

All configs stored in `~/Documents/config/` with symlinks to `~/.config/`:

```
~/Documents/config/hyprland  ->  ~/.config/hypr
~/Documents/config/kitty     ->  ~/.config/kitty
~/Documents/config/waybar    ->  ~/.config/waybar
~/Documents/config/wofi      ->  ~/.config/wofi
```

## Keybinds

### General
| Keybind | Action |
|---------|--------|
| Super + Return | Open terminal (kitty) |
| Super + C | Close window |
| Super + E | Open file manager (nautilus) |
| Super + R | Open app launcher (wofi) |
| Super + V | Toggle floating |
| Super + M | Exit Hyprland |

### Wallpaper
| Keybind | Action |
|---------|--------|
| Super + W | Open waypaper |

### Windows
| Keybind | Action |
|---------|--------|
| Super + Arrow | Move focus |
| Super + H/J/K/L | Move window |
| Super + Shift + Arrow | Swap window |
| Super + Ctrl + Arrow | Resize window |
| Super + O | Toggle split orientation |
| Ctrl + J/K | Focus up/down |

### Workspaces
| Keybind | Action |
|---------|--------|
| Super + 1-9 | Switch workspace |
| Super + Shift + 1-9 | Move window to workspace |
| Super + Mouse Scroll | Cycle workspaces |

### Other
| Keybind | Action |
|---------|--------|
| Super + B | Toggle waybar |

## Wallpapers

- Stored in: `~/Documents/wallpapers`
- Backend: swww
- GUI: waypaper
- Set waypaper folder to `~/Documents/wallpapers` and backend to `swww`

## Theme

- Color scheme: One Dark / Tokyo Night style
- Font: JetBrainsMono Nerd Font
- Waybar: Transparent with floating pill modules
- Kitty: One Dark colors, 11pt font, 95% opacity

## Setup from Scratch

```bash
# Install apps
sudo dnf install hyprland waybar wofi kitty swww waypaper nautilus hypridle

# Create symlinks
ln -s ~/Documents/config/hyprland ~/.config/hypr
ln -s ~/Documents/config/kitty ~/.config/kitty
ln -s ~/Documents/config/waybar ~/.config/waybar
ln -s ~/Documents/config/wofi ~/.config/wofi

# Create wallpapers folder
mkdir -p ~/Documents/wallpapers
```

## Notes

- Waybar toggle (Super+B) uses `pkill -SIGUSR1 waybar`
- swww-daemon starts automatically and sets random wallpaper on login
- Gaps: 10px equal on all sides
