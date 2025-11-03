
<h3 align="center">
  <img src="https://github.com/JaKooLit/Telegram-Animated-Emojis/blob/main/Activity/Sparkles.webp" alt="Sparkles" width="38" height="38" />
  # 🎬 Snaps-Dots - WehttamSnaps J.A.R.V.I.S. Configuration
  <img src="https://github.com/JaKooLit/Telegram-Animated-Emojis/blob/main/Activity/Sparkles.webp" alt="Sparkles" width="38" height="38" />
</h3>

<h3 align="center">
<img align="center" width="80%" src=https://raw.githubusercontent.com/Crowdrocker/Snaps-Dots/main/assets/github-header.png />
</h3>

<p align="center">
  <img src="https://raw.githubusercontent.com/JaKooLit/Hyprland-Dots/main/assets/latte.png" width="400" />
</p>

<div align="center">
  
[![Twitch](https://img.shields.io/badge/Twitch-WehttamSnaps-9146FF?style=for-the-badge&logo=twitch)](https://www.twitch.tv/wehttamsnaps)
[![YouTube](https://img.shields.io/badge/YouTube-WehttamSnaps-FF0000?style=for-the-badge&logo=youtube)](https://www.youtube.com/@WehttamSnaps)
[![GitHub](https://img.shields.io/badge/GitHub-Crowdrocker-181717?style=for-the-badge&logo=github)](https://github.com/Crowdrocker)

</div>

</div><br>

<div align="center">

![GitHub Repo stars](https://img.shields.io/github/stars/Crowdrocker/Hypr-Snaps?style=for-the-badge&color=cba6f7) ![GitHub last commit](https://img.shields.io/github/last-commit/Crowdrocker/Hypr-Snaps?style=for-the-badge&color=b4befe) ![GitHub repo size](https://img.shields.io/github/repo-size/Crowdrocker/Hypr-Snaps?style=for-the-badge&color=cba6f7) <a href="https://discord.gg/9bAVTCNZ"> <img src="https://img.shields.io/discord/1151869464405606400?style=for-the-badge&logo=discord&color=cba6f7&link=https%3A%2F%2Fdiscord.gg%9bAVTCNZ"> </a>

<br/>
</div>


![WehttamSnaps Logo](screenshots/logo.png)

**A complete Arch Linux Hyprland configuration for Photography • Gaming • Streaming**

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-00D9FF?logo=wayland&logoColor=white)](https://hyprland.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

*Matthew's (WehttamSnaps) complete workstation setup with J.A.R.V.I.S. theming*

[🚀 Quick Install](#-quick-installation) • [📸 Screenshots](#-screenshots) • [⌨️ Keybinds](#-keybindings) • [🎮 Gaming](#-gaming-setup) • [🎵 Audio](#-audio-setup)

</div>

---

# My Hyprland Dotfiles

Personal Hyprland setup based on ML4W dotfiles with custom modifications.

## Hardware
- CPU: Intel i7-4790
- GPU: AMD RX 580 8GB
- RAM: 16GB DDR3
- Storage: 1TB SSD + 2x 500GB SSD

## Features
- Gaming mode toggle (Super + F3) - disables animations/blur for performance
- AMD GPU optimizations
- Dual-boot with Windows 10
- Custom keybinds and workflow tweaks

## Installation

### Fresh Arch Install
1. Install Arch Linux
2. Run Chris Titus Linutil for base setup
3. Install ML4W dotfiles:
```bash
   git clone --depth=1 https://gitlab.com/stephan-raabe/dotfiles.git ~/ml4w-dotfiles
   cd ~/ml4w-dotfiles
   ./setup.sh
```
4. Clone this repo and copy over:
```bash
   git clone https://github.com/Crowdrocker/my-hyprland-dotfiles.git
   cp -r my-hyprland-dotfiles/* ~/.mydotfiles/
```
5. Reboot

## Key Customizations
- Gaming mode script in `.config/hypr/scripts/gaming-mode.sh`
- Custom keybinds in `.config/hypr/hyprland.conf`
- AMD-specific optimizations

## Notes
- Dotfiles are symlinked from `~/.mydotfiles` to `~/.config`
- Uses ML4W settings app for easy configuration

</div>
## 🫰	Thank you for the stars 🩷
## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Crowdrocker/my-hyprland-dotfiles.git&type=Date)](https://www.star-history.com/#Crowdrocker/Hypr-Snaps.git&Date)
