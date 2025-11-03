#!/usr/bin/env bash

# ============================================================
# My Custom Hyprland Setup
# Installs ML4W base + applies personal customizations
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NONE='\033[0m'

clear
echo -e "${BLUE}"
cat <<"EOF"
   ___          __                 
  / __\_   _ __/ /____  _ __ ___  
 / /  | | | / __/ __/ \/ / '_ ` _ \ 
/ /___| |_| \__ \ |_/ |\/| | | | | |
\____/ \__,_|___/\__\/_/  |_|_| |_|
                                    
Hyprland Setup
ML4W Base + Personal Customizations

EOF
echo -e "${NONE}"

# ============================================================
# Check if running on Arch
# ============================================================

if ! command -v pacman &> /dev/null; then
    echo -e "${RED}Error: This script is designed for Arch Linux${NONE}"
    exit 1
fi

# ============================================================
# Step 1: Install ML4W Dotfiles
# ============================================================

echo -e "${GREEN}[1/4] Installing ML4W Dotfiles...${NONE}"
echo

if [ ! -d "$HOME/ml4w-dotfiles" ]; then
    git clone --depth=1 https://gitlab.com/stephan-raabe/dotfiles.git ~/ml4w-dotfiles
    cd ~/ml4w-dotfiles
    ./setup.sh
else
    echo "ML4W dotfiles already exist. Skipping clone."
    echo "To reinstall ML4W, delete ~/ml4w-dotfiles and run this script again."
    read -p "Continue with customizations? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 0
    fi
fi

# ============================================================
# Step 2: Install Additional Packages
# ============================================================

echo -e "${GREEN}[2/4] Installing additional packages...${NONE}"
echo

# Add any extra packages you want beyond ML4W defaults
EXTRA_PACKAGES=(
    # Add your packages here
    # Example: btop neofetch discord
)

if [ ${#EXTRA_PACKAGES[@]} -gt 0 ]; then
    echo "Installing: ${EXTRA_PACKAGES[*]}"
    sudo pacman -S --needed --noconfirm "${EXTRA_PACKAGES[@]}"
else
    echo "No extra packages defined. Skipping."
fi

# ============================================================
# Step 3: Apply Custom Configurations
# ============================================================

echo -e "${GREEN}[3/4] Applying custom configurations...${NONE}"
echo

# Copy custom scripts
echo "→ Installing custom scripts..."
mkdir -p ~/.config/hypr/scripts
if [ -f "$SCRIPT_DIR/configs/scripts/gaming-mode.sh" ]; then
    cp "$SCRIPT_DIR/configs/scripts/gaming-mode.sh" ~/.config/hypr/scripts/
    chmod +x ~/.config/hypr/scripts/gaming-mode.sh
    echo "  ✓ Gaming mode script installed"
fi

# Append custom Hyprland config
echo "→ Adding custom Hyprland configurations..."
if [ -f "$SCRIPT_DIR/configs/hyprland/custom.conf" ]; then
    # Check if already sourced
    if ! grep -q "source.*custom.conf" ~/.config/hypr/hyprland.conf; then
        echo "" >> ~/.config/hypr/hyprland.conf
        echo "# Custom configurations" >> ~/.config/hypr/hyprland.conf
        echo "source = ~/.config/hypr/custom.conf" >> ~/.config/hypr/hyprland.conf
        echo "  ✓ Custom config linked"
    fi
    cp "$SCRIPT_DIR/configs/hyprland/custom.conf" ~/.config/hypr/custom.conf
fi

# Copy custom waybar styles (if any)
if [ -f "$SCRIPT_DIR/configs/waybar/custom-style.css" ]; then
    echo "→ Installing custom Waybar styles..."
    cp "$SCRIPT_DIR/configs/waybar/custom-style.css" ~/.config/waybar/
    echo "  ✓ Custom Waybar styles installed"
fi

# Copy kitty config (if any)
if [ -f "$SCRIPT_DIR/configs/kitty/kitty.conf" ]; then
    echo "→ Installing custom Kitty config..."
    mkdir -p ~/.config/kitty
    cp "$SCRIPT_DIR/configs/kitty/kitty.conf" ~/.config/kitty/
    echo "  ✓ Custom Kitty config installed"
fi

# ============================================================
# Step 4: Setup Git Tracking (Optional)
# ============================================================

echo -e "${GREEN}[4/4] Setting up Git tracking...${NONE}"
echo

if [ ! -d ~/.mydotfiles/.git ]; then
    read -p "Initialize Git repository for dotfiles tracking? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cd ~/.mydotfiles
        git init
        
        # Create .gitignore
        cat > .gitignore <<'EOL'
# Cache and temporary files
**/.cache/
**/cache/
**/*.log
**/__pycache__/
**/com.ml4w.hyprlandsettings/

# Sensitive files
**/*secret*
**/*password*
**/*token*
*.key
*.pem
EOL
        
        git add .
        git commit -m "Initial commit - ML4W + custom configs"
        echo -e "${GREEN}✓ Git repository initialized in ~/.mydotfiles${NONE}"
        echo "Next: Open GitHub Desktop and publish this repository"
    fi
else
    echo "Git repository already exists in ~/.mydotfiles"
fi

# ============================================================
# Complete
# ============================================================

echo
echo -e "${GREEN}============================================${NONE}"
echo -e "${GREEN}Installation Complete!${NONE}"
echo -e "${GREEN}============================================${NONE}"
echo
echo "Custom configurations applied:"
echo "  • Gaming mode toggle: Super + F3"
echo "  • Custom scripts in ~/.config/hypr/scripts/"
echo "  • Your configs are layered on top of ML4W"
echo
echo "To update ML4W base in the future:"
echo "  cd ~/ml4w-dotfiles && git pull && ./setup.sh"
echo
echo "Your customizations are preserved in:"
echo "  ~/.config/hypr/custom.conf"
echo "  ~/.config/hypr/scripts/"
echo
echo -e "${YELLOW}Reboot or re-login to apply all changes${NONE}"
echo