# My Hyprland Setup Repository Structure

## Folder Layout

```
my-hyprland-setup/
├── install.sh                    # Main installer (the script I just created)
├── README.md                     # Documentation
├── configs/                      # Your custom configs only
│   ├── hyprland/
│   │   ├── custom.conf          # Your Hyprland additions
│   │   └── keybinds.conf        # Custom keybinds (optional)
│   ├── scripts/
│   │   ├── gaming-mode.sh       # Your gaming toggle script
│   │   └── other-scripts.sh     # Any other custom scripts
│   ├── waybar/
│   │   └── custom-style.css     # Waybar style tweaks
│   ├── kitty/
│   │   └── kitty.conf           # Terminal config
│   └── wofi/
│       └── style.css            # App launcher styling
├── packages.txt                  # List of extra packages (optional)
└── .gitignore                   # What not to track
```

## What Goes In Each File

### `configs/hyprland/custom.conf`
Your personal Hyprland tweaks that get appended to ML4W's config:

```conf
# Gaming mode toggle
bind = $mainMod, F3, exec, ~/.config/hypr/scripts/gaming-mode.sh

# Your custom keybinds
bind = $mainMod, B, exec, firefox
bind = $mainMod, C, exec, code

# Your monitor setup if different
# monitor=DP-1,1920x1080@144,0x0,1

# Your custom animations/effects overrides
# animations {
#     enabled = true
#     bezier = myBezier, 0.05, 0.9, 0.1, 1.05
# }
```

### `configs/scripts/gaming-mode.sh`
The gaming mode toggle script we created earlier

### `packages.txt` (optional)
List extra packages you want:
```
btop
neofetch
discord
obs-studio
spotify
```

### `README.md`
Document your setup:

```markdown
# My Hyprland Setup

Personal Hyprland configuration based on ML4W dotfiles.

## Quick Install

On fresh Arch install:

1. Run Chris Titus Linutil for base system setup
2. Clone this repo:
   ```bash
   git clone https://github.com/yourusername/my-hyprland-setup.git
   cd my-hyprland-setup
   chmod +x install.sh
   ./install.sh
   ```

## Features

- Gaming mode toggle (Super + F3)
- AMD GPU optimizations
- Custom keybinds
- Personal color scheme

## Hardware

- CPU: i7-4790
- GPU: RX 580 8GB
- RAM: 16GB DDR3

## Updating

To update ML4W base:
```bash
cd ~/ml4w-dotfiles
git pull
./setup.sh
```

Your customizations will be preserved.
```

## How to Use This Setup

### First Time Setup:

1. **Create the repository in GitHub Desktop** (like you were doing)
   - Name it `my-hyprland-setup`

2. **Create the folder structure locally:**
   ```bash
   cd ~/Documents/GitHub/my-hyprland-setup
   mkdir -p configs/{hyprland,scripts,waybar,kitty}
   ```

3. **Copy the install.sh script** (the one I created above)
   ```bash
   # Save the install.sh content to install.sh
   chmod +x install.sh
   ```

4. **Create your custom.conf:**
   ```bash
   nano configs/hyprland/custom.conf
   # Add your custom keybinds and settings
   ```

5. **Copy your gaming-mode.sh:**
   ```bash
   cp ~/.config/hypr/scripts/gaming-mode.sh configs/scripts/
   ```

6. **Commit everything in GitHub Desktop**

### On a Fresh Install:

1. Install Arch
2. Run Linutil (Chris Titus)
3. Clone your repo
4. Run `./install.sh`
5. Done!

## Benefits

✅ **Small repo** - Only YOUR changes, not all of ML4W  
✅ **Easy updates** - Update ML4W anytime without conflicts  
✅ **Clean separation** - Know exactly what you customized  
✅ **Portable** - Works on any Arch system  
✅ **Maintainable** - Easy to understand and modify  

## Alternative: Track Everything

If you prefer to track the entire dotfiles folder (simpler but larger):

```bash
cd ~/.mydotfiles
git init
git add .
git commit -m "Initial commit"
```

Then manage with GitHub Desktop as usual. This is easier but you lose the benefits of separating your changes from ML4W's base.