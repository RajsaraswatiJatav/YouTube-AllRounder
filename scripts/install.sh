#!/data/data/com.termux/files/usr/bin/bash

# YouTube AllRounder 6.0 - Installation Script
# Author: Rajsaraswati Jatav
# Description: Automated Installer for Galactic YouTube Downloader
# License: MIT License
# Repository: https://github.com/RajsaraswatiJatav/YouTube-AllRounder
# Version: 6.0.2024

# ANSI Colors for Vibrant UI
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
NC='\033[0m' # No Color

# Download Path
DOWNLOAD_PATH="/sdcard/YouTubeAllRounder6"

# ASCII Art Banner
ascii_banner() {
    clear
    echo -e "${RED}══════════════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}      ____  ____ ___ _______   ____ _  _______ ____ ${NC}"
    echo -e "${YELLOW}     | __ )| __ )_ _|_   _| |  _ \\| |/ / ____|  _ \\ ${NC}"
    echo -e "${CYAN}     |  _ \\|  _ \\| |  | |   | |_) | ' /|  _| | | | |${NC}"
    echo -e "${CYAN}     | |_) | |_) | |  | |   |  _ <| . \\| |___| |_| |${NC}"
    echo -e "${YELLOW}     |____/|____/|___|_|   |_| \\_\\_|\\_|_____|____/ ${NC}"
    echo -e "${PURPLE}   🌌 YouTube AllRounder 6.0 Installer by Rajsaraswati Jatav 🌌${NC}"
    echo -e "${RED}══════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN} 🚀 Preparing to launch your galactic download experience! 🚀${NC}"
    sleep 2
}

# Dynamic Spinner
spinner() {
    local spinners=('-\|/' '⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏' '◴ ◷ ◶ ◵')
    local spinner=${spinners[$RANDOM % ${#spinners[@]}]}
    local i=0
    for ((j=0; j<15; j++)); do
        printf "\r${CYAN}Processing... ${spinner:$((i%${#spinner})):1}${NC}"
        i=$((i+1))
        sleep 0.08
    done
    echo -e "\r${GREEN}✅ Complete!${NC}"
}

# Sensory Feedback (Toasts & Vibrations)
notify() {
    termux-toast -g top -b black -c white "$1"
    case "$2" in
        "success") termux-vibrate -d 200 ;;
        "error") termux-vibrate -d 400 ;;
        "start") termux-vibrate -d 100 ;;
        *) termux-vibrate -d 150 ;;
    esac
}

# Check if Termux is properly set up
check_termux() {
    echo -e "${YELLOW}🔍 Checking Termux environment...${NC}"
    spinner
    if ! command -v pkg &>/dev/null; then
        echo -e "${RED}❌ Termux not found! Please install Termux from F-Droid.${NC}"
        notify "Termux not found!" "error"
        exit 1
    fi
    notify "Termux environment ready!" "success"
}

# Install Dependencies
install_deps() {
    echo -e "${YELLOW}🔧 Installing dependencies...${NC}"
    spinner
    pkg update -y && pkg upgrade -y
    pkg install python ffmpeg termux-api git -y
    pip install --upgrade pip
    pip install yt-dlp
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌ Failed to install dependencies! Check internet connection.${NC}"
        notify "Dependency installation failed!" "error"
        exit 1
    fi
    notify "Dependencies installed!" "success"
}

# Setup Storage
setup_storage() {
    echo -e "${YELLOW}📁 Setting up storage permissions...${NC}"
    spinner
    termux-setup-storage
    mkdir -p "$DOWNLOAD_PATH/sounds"
    if [ ! -d "$DOWNLOAD_PATH" ]; then
        echo -e "${RED}❌ Failed to create $DOWNLOAD_PATH! Check storage permissions.${NC}"
        notify "Storage setup failed!" "error"
        exit 1
    fi
    notify "Storage permissions granted!" "success"
}

# Setup Main Script
setup_script() {
    echo -e "${YELLOW}📜 Setting up termux-url-opener script...${NC}"
    spinner
    if [ ! -f "termux-url-opener" ]; then
        echo -e "${RED}❌ termux-url-opener not found in current directory!${NC}"
        notify "Script not found!" "error"
        exit 1
    fi
    mkdir -p ~/bin
    cp termux-url-opener ~/bin/termux-url-opener
    chmod +x ~/bin/termux-url-opener
    if [ ! -f "~/bin/termux-url-opener" ]; then
        echo -e "${RED}❌ Failed to setup script!${NC}"
        notify "Script setup failed!" "error"
        exit 1
    fi
    notify "Script installed!" "success"
}

# Setup Sound Files
setup_sounds() {
    echo -e "${YELLOW}🔊 Setting up sound files for sensory experience...${NC}"
    spinner
    for sound in start.wav success.wav error.wav notify.wav; do
        if [ ! -f "$DOWNLOAD_PATH/sounds/$sound" ]; then
            echo "Placeholder" > "$DOWNLOAD_PATH/sounds/$sound"
            echo -e "${CYAN}ℹ️ Created placeholder for $sound. Replace with real WAV file for best experience.${NC}"
        fi
    done
    echo -e "${GREEN}✅ Sound files setup in $DOWNLOAD_PATH/sounds/.${NC}"
    echo -e "${CYAN}ℹ️ Add real WAV files (1-2s clips) from Freesound.org for full sensory effects.${NC}"
    notify "Sound files setup complete!" "success"
}

# Main Installation Process
main() {
    ascii_banner
    notify "Starting installation..." "start"
    check_termux
    install_deps
    setup_storage
    setup_script
    setup_sounds
    echo -e "${GREEN}🎉 Installation complete!${NC}"
    echo -e "${PURPLE}🌟 YouTube AllRounder 6.0 by Rajsaraswati Jatav is ready! 🌟${NC}"
    echo -e "${CYAN}🔥 Run with: ~/bin/termux-url-opener <YouTube-URL>${NC}"
    echo -e "${CYAN}📌 Share your galactic journey on Instagram: @official_rajsaraswati_jatav${NC}"
    notify "Installation successful! Ready to download!" "success"
}

# Execute Main
main
