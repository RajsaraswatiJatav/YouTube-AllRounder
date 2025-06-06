#!/data/data/com.termux/files/usr/bin/bash

# YouTube AllRounder 6.0 - Sound Setup Script
# Author: Rajsaraswati Jatav
# Description: Configures Sound Files for Galactic Sensory Experience
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
    echo -e "${PURPLE}   🌌 Sound Setup for YouTube AllRounder 6.0 by Rajsaraswati Jatav 🌌${NC}"
    echo -e "${RED}══════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN} 🔊 Preparing to enhance your galactic sensory experience! 🔊${NC}"
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

# Check Storage Permissions
check_storage() {
    echo -e "${YELLOW}📁 Checking storage permissions...${NC}"
    spinner
    if [ ! -d "/sdcard" ]; then
        echo -e "${RED}❌ Storage not accessible! Run 'termux-setup-storage' first.${NC}"
        notify "Storage not accessible!" "error"
        exit 1
    fi
    notify "Storage access confirmed!" "success"
}

# Create Sound Directory and Placeholder Files
setup_sounds() {
    echo -e "${YELLOW}🔊 Setting up sound files...${NC}"
    spinner
    mkdir -p "$DOWNLOAD_PATH/sounds"
    for sound in start.wav success.wav error.wav notify.wav; do
        if [ ! -f "$DOWNLOAD_PATH/sounds/$sound" ]; then
            echo "Placeholder for $sound" > "$DOWNLOAD_PATH/sounds/$sound"
            echo -e "${CYAN}ℹ️ Created placeholder for $sound.${NC}"
        else
            echo -e "${GREEN}✅ $sound already exists.${NC}"
        fi
    done
    if [ ! -d "$DOWNLOAD_PATH/sounds" ]; then
        echo -e "${RED}❌ Failed to create $DOWNLOAD_PATH/sounds! Check permissions.${NC}"
        notify "Sound directory creation failed!" "error"
        exit 1
    fi
    notify "Sound files setup complete!" "success"
}

# Provide Guidance for Real WAV Files
sound_guidance() {
    echo -e "${YELLOW}🎵 Sound Files Guidance:${NC}"
    echo -e "${CYAN}ℹ️ For the full sensory experience, replace placeholder files in $DOWNLOAD_PATH/sounds/ with real WAV files:${NC}"
    echo -e "${BLUE} - start.wav: Sound for download initiation (e.g., sci-fi beep).${NC}"
    echo -e "${BLUE} - success.wav: Sound for download completion (e.g., chime).${NC}"
    echo -e "${BLUE} - error.wav: Sound for errors (e.g., buzz).${NC}"
    echo -e "${BLUE} - notify.wav: Sound for general notifications (e.g., click).${NC}"
    echo -e "${CYAN}📌 Recommended: Use 1-2 second WAV clips from Freesound.org or create your own.${NC}"
    echo -e "${CYAN}📌 Ensure files are named exactly as listed above.${NC}"
    notify "Sound guidance provided!" "success"
}

# Main Setup Process
main() {
    ascii_banner
    notify "Starting sound setup..." "start"
    check_storage
    setup_sounds
    sound_guidance
    echo -e "${GREEN}🎉 Sound setup complete for YouTube AllRounder 6.0!${NC}"
    echo -e "${PURPLE}🌟 Enhance your downloads with cosmic sound effects! 🌟${NC}"
    echo -e "${CYAN}🔥 Follow @official_rajsaraswati_jatav on Instagram!${NC}"
    notify "Sound setup successful!" "success"
}

# Execute Main
main
