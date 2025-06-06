#!/data/data/com.termux/files/usr/bin/bash

# YouTube AllRounder 6.0
# Author: Rajsaraswati Jatav
# Description: Galactic YouTube Downloader with Mind-Exploding Features & Sensory Spectacle!
# License: MIT License
# Repository: https://github.com/RajsaraswatiJatav/YouTube-AllRounder

# ANSI Colors for Ultra-Vibrant UI
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Language Selection (English, Hindi)
LANG="en"
[ -f ~/.yt_allrounder_lang ] && LANG=$(cat ~/.yt_allrounder_lang)

# Messages in English and Hindi
declare -A MSG_EN=(
    ["welcome"]="🌌 YouTube AllRounder 6.0 by Rajsaraswati Jatav 🌌"
    ["select_lang"]="Select Language: 1) English 2) Hindi"
    ["menu"]="🚀 Launch Your Galactic Download Odyssey: 🚀"
    ["opt1"]="🎬 Video (Custom Resolution & Format)"
    ["opt2"]="📺 Video (720p Hyper Mode)"
    ["opt3"]="🎵 Audio Only (MP3/AAC/M4A)"
    ["opt4"]="📋 Entire Playlist"
    ["opt5"]="📜 Video with Subtitles"
    ["opt6"]="📡 Live Stream Capture"
    ["opt7"]="🖼️ Download Thumbnail (HQ)"
    ["opt8"]="ℹ️ Extract Metadata (JSON)"
    ["opt9"]="📁 Custom File Naming"
    ["opt10"]="📦 Batch URL Download"
    ["opt11"]="📱 YouTube Shorts Mode"
    ["opt12"]="⚡ Speed Limit Download"
    ["opt13"]="🔒 Proxy Download"
    ["opt14"]="⏰ Schedule Download"
    ["opt15"]="🔄 Auto-Resume Downloads"
    ["opt16"]="✂️ Video Trimming"
    ["opt17"]="📋 Download Queue"
    ["opt18"]="📊 Real-Time Progress"
    ["opt19"]="🌐 Change Language"
    ["opt20"]="🚪 Exit"
    ["invalid"]="❌ Invalid choice! Retry your mission! ❌"
    ["url_missing"]="❌ Error: No YouTube URL detected! Share a link. ❌"
    ["done"]="🎉 Mission Accomplished! Files saved in $DOWNLOAD_PATH 🎉"
    ["thanks"]="🌟 Thank you for soaring with YouTube AllRounder 6.0! 🌟"
    ["format_preview"]="Available formats:"
    ["schedule"]="Enter schedule time (HH:MM, 24-hour):"
    ["trim"]="Enter trim duration (start=MM:SS end=MM:SS):"
    ["queue"]="Enter URLs to queue (space-separated, or 'done'):"
    ["progress"]="Download progress:"
)
declare -A MSG_HI=(
    ["welcome"]="🌌 यूट्यूब ऑलराउंडर 6.0, राजसरस्वती जाटव द्वारा 🌌"
    ["select_lang"]="भाषा चुनें: 1) अंग्रेजी 2) हिंदी"
    ["menu"]="🚀 अपना गैलेक्टिक डाउनलोड ओडिसी शुरू करें: 🚀"
    ["opt1"]="🎬 वीडियो (कस्टम रिज़ॉल्यूशन और फॉर्मेट)"
    ["opt2"]="📺 वीडियो (720p हाइपर मोड)"
    ["opt3"]="🎵 केवल ऑडियो (MP3/AAC/M4A)"
    ["opt4"]="📋 पूरी प्लेलिस्ट"
    ["opt5"]="📜 सबटाइटल्स के साथ वीडियो"
    ["opt6"]="📡 लाइव स्ट्रीम कैप्चर"
    ["opt7"]="🖼️ थंबनेल डाउनलोड (HQ)"
    ["opt8"]="ℹ️ मेटाडेटा निकालें (JSON)"
    ["opt9"]="📁 कस्टम फाइल नेमिंग"
    ["opt10"]="📦 बैच URL डाउनलोड"
    ["opt11"]="📱 यूट्यूब शॉर्ट्स मोड"
    ["opt12"]="⚡ स्पीड लिमिट डाउनलोड"
    ["opt13"]="🔒 प्रॉक्सी डाउनलोड"
    ["opt14"]="⏰ डाउनलोड शेड्यूल"
    ["opt15"]="🔄 असफल डाउनलोड्स रिज्यूम"
    ["opt16"]="✂️ वीडियो ट्रिमिंग"
    ["opt17"]="📋 डाउनलोड क्यू"
    ["opt18"]="📊 रियल-टाइम प्रोग्रेस"
    ["opt19"]="🌐 भाषा बदलें"
    ["opt20"]="🚪 बाहर निकलें"
    ["invalid"]="❌ अमान्य विकल्प! फिर से कोशिश करें! ❌"
    ["url_missing"]="❌ त्रुटि: कोई यूट्यूब URL नहीं मिला! लिंक शेयर करें। ❌"
    ["done"]="🎉 मिशन पूरा! फाइलें $DOWNLOAD_PATH में सहेजी गईं 🎉"
    ["thanks"]="🌟 यूट्यूब ऑलराउंडर 6.0 का उपयोग करने के लिए धन्यवाद! 🌟"
    ["format_preview"]="उपलब्ध फॉर्मेट्स:"
    ["schedule"]="शेड्यूल समय दर्ज करें (HH:MM, 24-घंटे):"
    ["trim"]="ट्रिम अवधि दर्ज करें (start=MM:SS end=MM:SS):"
    ["queue"]="क्यू में URL दर्ज करें (स्पेस से अलग, या 'done'):"
    ["progress"]="डाउनलोड प्रोग्रेस:"
)

# 3D-Like ASCII Animation
ascii_art() {
    clear
    frames=(
        "${RED}══════════════════════════════════════════════════════${NC}\n${YELLOW}      ____  ____ ___ _______   ____ _  _______ ____ ${NC}\n${YELLOW}     | __ )| __ )_ _|_   _| |  _ \\| |/ / ____|  _ \\ ${NC}\n${CYAN}     |  _ \\|  _ \\| |  | |   | |_) | ' /|  _| | | | |${NC}\n${CYAN}     | |_) | |_) | |  | |   |  _ <| . \\| |___| |_| |${NC}\n${YELLOW}     |____/|____/|___|_|   |_| \\_\\_|\\_|_____|____/ ${NC}\n${PURPLE}   🌌 YouTube AllRounder 6.0 by Rajsaraswati Jatav 🌌${NC}\n${RED}══════════════════════════════════════════════════════${NC}"
        "${RED}══════════════════════════════════════════════════════${NC}\n${YELLOW}      ____  ____ ___ _______ * ____ _  _______ ____ ${NC}\n${YELLOW}     | __ )| __ )_ _|_   _| *  _ \\| |/ / ____|  _ \\ ${NC}\n${CYAN}     |  _ \\|  _ \\| |  | | * | |_) | ' /|  _| | | | |${NC}\n${CYAN}     | |_) | |_) | |  | | * |  _ <| . \\| |___| |_| |${NC}\n${YELLOW}     |____/|____/|___|_| * |_| \\_\\_|\\_|_____|____/ ${NC}\n${PURPLE}   🌌 YouTube AllRounder 6.0 by Rajsaraswati Jatav 🌌${NC}\n${RED}══════════════════════════════════════════════════════${NC}"
        "${RED}══════════════════════════════════════════════════════${NC}\n${YELLOW}      ____  ____ ___ _______ * ____ _  _______ ____ ${NC}\n${YELLOW}     | __ )| __ )_ _|_   _| *  _ \\| |/ / ____|  _ \\ ${NC}\n${CYAN}     |  _ \\|  _ \\| |  | |   * | |_) | ' /|  _| | | | |${NC}\n${CYAN}     | |_) | |_) | |  | | * * |  _ <| . \\| |___| |_| |${NC}\n${YELLOW}     |____/|____/|___|_| * * |_| \\_\\_|\\_|_____|____/ ${NC}\n${PURPLE}   🌌 YouTube AllRounder 6.0 by Rajsaraswati Jatav 🌌${NC}\n${RED}══════════════════════════════════════════════════════${NC}"
    )
    for frame in "${frames[@]}"; do
        clear
        echo -e "$frame"
        echo -e "${GREEN} 🎥 Galactic Downloader with Mind-Exploding Features! 🎵${NC}"
        echo -e "${BLUE} ✨ Powered by yt-dlp | Termux-Optimized ✨${NC}"
        sleep 0.15
    done
}

# Dynamic Multi-Style Spinner
spinner() {
    local spinners=('-\|/' '⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏' '◴ ◷ ◶ ◵' '⣾ ⣷ ⣯ ⣟ ⡿ ⢿ ⣻ ⣽')
    local spinner=${spinners[$RANDOM % ${#spinners[@]}]}
    local i=0
    for ((j=0; j<15; j++)); do
        printf "\r${CYAN}Processing... ${spinner:$((i%${#spinner})):1}${NC}"
        i=$((i+1))
        sleep 0.08
    done
    echo -e "\r${GREEN}✅ Ready!${NC}"
}

# Sensory Feedback (Toasts, Vibrations, Sounds)
notify() {
    termux-toast -g top -b black -c white "$1"
    case "$2" in
        "success") termux-vibrate -d 200; [ -f "$DOWNLOAD_PATH/sounds/success.wav" ] && termux-media-player play "$DOWNLOAD_PATH/sounds/success.wav" ;;
        "error") termux-vibrate -d 400; [ -f "$DOWNLOAD_PATH/sounds/error.wav" ] && termux-media-player play "$DOWNLOAD_PATH/sounds/error.wav" ;;
        "start") termux-vibrate -d 100; [ -f "$DOWNLOAD_PATH/sounds/start.wav" ] && termux-media-player play "$DOWNLOAD_PATH/sounds/start.wav" ;;
        *) termux-vibrate -d 150; [ -f "$DOWNLOAD_PATH/sounds/notify.wav" ] && termux-media-player play "$DOWNLOAD_PATH/sounds/notify.wav" ;;
    esac
}

# Progress Bar with Percentage & Animation
progress_bar() {
    echo -e "${CYAN}${MSG_${LANG}[progress]}${NC}"
    for i in {1..10}; do
        echo -ne "${GREEN}█${NC}"
        printf " %d%% " $((i*10))
        sleep 0.12
    done
    echo -e "${GREEN} Done!${NC}"
    notify "${MSG_${LANG}[done]}" "success"
}

# Check Dependencies
check_deps() {
    echo -e "${YELLOW}🔧 Activating galactic dependencies...${NC}"
    spinner
    pkg update -y && pkg upgrade -y
    pkg install python ffmpeg termux-api -y
    pip install --upgrade pip
    pip install yt-dlp
    termux-setup-storage
    mkdir -p "$DOWNLOAD_PATH/sounds"
    echo -e "${GREEN}✅ Dependencies activated!${NC}"
    notify "Dependencies ready!" "success"
    sleep 1
}

# Create Download Directory
DOWNLOAD_PATH="/sdcard/YouTubeAllRounder6"
mkdir -p "$DOWNLOAD_PATH"

# Check if URL is provided
if [ -z "$1" ]; then
    ascii_art
    echo -e "${RED}${MSG_${LANG}[url_missing]}${NC}"
    notify "${MSG_${LANG}[url_missing]}" "error"
    exit 1
fi

# Language Selection Menu
select_language() {
    ascii_art
    echo -e "${YELLOW}${MSG_${LANG}[select_lang]}${NC}"
    read -p "$(echo -e ${YELLOW}"Enter choice (1-2): "${NC})" lang_choice
    case $lang_choice in
        1) echo "en" > ~/.yt_allrounder_lang; LANG="en" ;;
        2) echo "hi" > ~/.yt_allrounder_lang; LANG="hi" ;;
        *) echo -e "${RED}Invalid language choice. Defaulting to English.${NC}"; LANG="en" ;;
    esac
    notify "Language set to ${LANG}!" "success"
}

# Format Preview Function
format_preview() {
    echo -e "${YELLOW}${MSG_${LANG}[format_preview]}${NC}"
    yt-dlp --list-formats "$1" | grep -E "video|audio"
    echo -e "${YELLOW}Enter format code (e.g., 137 for 1080p):${NC}"
    read format_code
    echo $format_code
}

# Schedule Download Function
schedule_download() {
    echo -e "${YELLOW}${MSG_${LANG}[schedule]}${NC}"
    read -p "$(echo -e ${YELLOW}"Enter time (HH:MM): "${NC})" schedule_time
    current_time=$(date +%s)
    schedule_epoch=$(date -d "$schedule_time" +%s 2>/dev/null)
    if [ $? -ne 0 ]; then
        echo -e "${RED}Invalid time format! Using immediate download.${NC}"
        notify "Invalid time format!" "error"
        return 1
    fi
    if [ $schedule_epoch -le $current_time ]; then
        schedule_epoch=$((schedule_epoch + 86400)) # Assume next day
    fi
    echo -e "${CYAN}Scheduled for $(date -d @$schedule_epoch)${NC}"
    notify "Download scheduled!" "start"
    sleep $((schedule_epoch - current_time))
    return 0
}

# Video Trimming Function
trim_video() {
    echo -e "${YELLOW}${MSG_${LANG}[trim]}${NC}"
    read -p "$(echo -e ${YELLOW}"Start time (MM:SS): "${NC})" start_time
    read -p "$(echo -e ${YELLOW}"End time (MM:SS): "${NC})" end_time
    start_time=${start_time:-"00:00"}
    end_time=${end_time:-"01:00"}
    echo "--postprocessor-args \"-ss $start_time -to $end_time\""
}

# Download Queue Management
queue_downloads() {
    echo -e "${YELLOW}${MSG_${LANG}[queue]}${NC}"
    local urls=()
    while true; do
        read -p "$(echo -e ${YELLOW}"Enter URL (or 'done'): "${NC})" url
        if [ "$url" = "done" ]; then break; fi
        urls+=("$url")
    done
    echo "${urls[@]}"
}

# Real-Time Progress Monitoring
progress_monitor() {
    local url="$1"
    local output_file="$DOWNLOAD_PATH/%(title)s.%(ext)s"
    echo -e "${YELLOW}${MSG_${LANG}[progress]}${NC}"
    yt-dlp --no-mtime -o "$output_file" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best" "$url" --progress --newline | while read -r line; do
        if echo "$line" | grep -q "download"; then
            percent=$(echo "$line" | grep -oP '\d+\.\d+%')
            if [ -n "$percent" ]; then
                echo -ne "\r${CYAN}Progress: $percent${NC}"
            fi
        fi
    done
    echo -e "${GREEN} Done!${NC}"
    notify "${MSG_${LANG}[done]}" "success"
}

# Main Menu
menu() {
    ascii_art
    echo -e "${PURPLE}${MSG_${LANG}[menu]}${NC}"
    echo -e "${GREEN}1) ${MSG_${LANG}[opt1]}${NC}"
    echo -e "${GREEN}2) ${MSG_${LANG}[opt2]}${NC}"
    echo -e "${GREEN}3) ${MSG_${LANG}[opt3]}${NC}"
    echo -e "${GREEN}4) ${MSG_${LANG}[opt4]}${NC}"
    echo -e "${GREEN}5) ${MSG_${LANG}[opt5]}${NC}"
    echo -e "${GREEN}6) ${MSG_${LANG}[opt6]}${NC}"
    echo -e "${GREEN}7) ${MSG_${LANG}[opt7]}${NC}"
    echo -e "${GREEN}8) ${MSG_${LANG}[opt8]}${NC}"
    echo -e "${GREEN}9) ${MSG_${LANG}[opt9]}${NC}"
    echo -e "${GREEN}10) ${MSG_${LANG}[opt10]}${NC}"
    echo -e "${GREEN}11) ${MSG_${LANG}[opt11]}${NC}"
    echo -e "${GREEN}12) ${MSG_${LANG}[opt12]}${NC}"
    echo -e "${GREEN}13) ${MSG_${LANG}[opt13]}${NC}"
    echo -e "${GREEN}14) ${MSG_${LANG}[opt14]}${NC}"
    echo -e "${GREEN}15) ${MSG_${LANG}[opt15]}${NC}"
    echo -e "${GREEN}16) ${MSG_${LANG}[opt16]}${NC}"
    echo -e "${GREEN}17) ${MSG_${LANG}[opt17]}${NC}"
    echo -e "${GREEN}18) ${MSG_${LANG}[opt18]}${NC}"
    echo -e "${GREEN}19) ${MSG_${LANG}[opt19]}${NC}"
    echo -e "${GREEN}20) ${MSG_${LANG}[opt20]}${NC}"
    read -p "$(echo -e ${YELLOW}"Enter choice (1-20): "${NC})" choice
}

# Download Function
download() {
    local url="$1"
    local schedule=0
    if [ "$2" = "schedule" ]; then
        schedule_download || schedule=0
        schedule=1
    fi
    notify "Starting download..." "start"
    case $choice in
        1)
            echo -e "${GREEN}${MSG_${LANG}[opt1]}${NC}"
            format_code=$(format_preview "$url")
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" -f "$format_code+bestaudio/best" "$url"
            ;;
        2)
            echo -e "${GREEN}${MSG_${LANG}[opt2]}${NC}"
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" -f "bestvideo[height<=720]+bestaudio/best" "$url"
            ;;
        3)
            echo -e "${GREEN}${MSG_${LANG}[opt3]}${NC}"
            echo -e "${YELLOW}Choose format: 1) MP3 2) AAC 3) M4A${NC}"
            read -p "$(echo -e ${YELLOW}"Enter choice (1-3): "${NC})" audio_format
            audio_format=${audio_format:-1}
            case $audio_format in
                1) format="mp3" ;;
                2) format="aac" ;;
                3) format="m4a" ;;
                *) format="mp3" ;;
            esac
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" --extract-audio --audio-format "$format" "$url"
            ;;
        4)
            echo -e "${GREEN}${MSG_${LANG}[opt4]}${NC}"
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(playlist_title)s/%(title)s.%(ext)s" --yes-playlist "$url"
            ;;
        5)
            echo -e "${GREEN}${MSG_${LANG}[opt5]}${NC}"
            read -p "$(echo -e ${YELLOW}"Enter subtitle language (e.g., en, hi, or blank for auto): "${NC})" sub_lang
            sub_lang=${sub_lang:-"en"}
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" --write-auto-sub --sub-lang "$sub_lang" --embed-subs -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best" "$url"
            ;;
        6)
            echo -e "${GREEN}${MSG_${LANG}[opt6]}${NC}"
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" --hls-prefer-ffmpeg "$url"
            ;;
        7)
            echo -e "${GREEN}${MSG_${LANG}[opt7]}${NC}"
            progress_bar
            yt-dlp --no-mtime --skip-download --write-thumbnail -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" "$url"
            ;;
        8)
            echo -e "${GREEN}${MSG_${LANG}[opt8]}${NC}"
            progress_bar
            yt-dlp --no-mtime --skip-download --dump-json "$url" > "$DOWNLOAD_PATH/metadata_$(date +%F_%H-%M-%S).json"
            echo -e "${GREEN}✅ Metadata saved to $DOWNLOAD_PATH/metadata_$(date +%F_%H-%M-%S).json${NC}"
            notify "Metadata saved!" "success"
            ;;
        9)
            echo -e "${GREEN}${MSG_${LANG}[opt9]}${NC}"
            read -p "$(echo -e ${YELLOW}"Enter custom filename (without extension): "${NC})" custom_name
            custom_name=${custom_name:-"%(title)s"}
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/$custom_name.%(ext)s" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best" "$url"
            ;;
        10)
            echo -e "${GREEN}${MSG_${LANG}[opt10]}${NC}"
            read -p "$(echo -e ${YELLOW}"Enter multiple URLs (space-separated): "${NC})" urls
            for u in $urls; do
                progress_bar
                yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best" "$u"
            done
            ;;
        11)
            echo -e "${GREEN}${MSG_${LANG}[opt11]}${NC}"
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s_Shorts.%(ext)s" -f "bestvideo[height<=1080]+bestaudio/best" "$url"
            ;;
        12)
            echo -e "${GREEN}${MSG_${LANG}[opt12]}${NC}"
            read -p "$(echo -e ${YELLOW}"Enter speed limit (e.g., 500K for 500KB/s): "${NC})" speed
            speed=${speed:-"1000K"}
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" --limit-rate "$speed" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best" "$url"
            ;;
        13)
            echo -e "${GREEN}${MSG_${LANG}[opt13]}${NC}"
            read -p "$(echo -e ${YELLOW}"Enter proxy URL (e.g., http://proxy:port): "${NC})" proxy
            proxy=${proxy:-""}
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" --proxy "$proxy" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best" "$url"
            ;;
        14)
            echo -e "${GREEN}${MSG_${LANG}[opt14]}${NC}"
            download "$url" "schedule"
            ;;
        15)
            echo -e "${GREEN}${MSG_${LANG}[opt15]}${NC}"
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" --continue --retries 10 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best" "$url"
            ;;
        16)
            echo -e "${GREEN}${MSG_${LANG}[opt16]}${NC}"
            trim_args=$(trim_video)
            progress_bar
            yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s_trimmed.%(ext)s" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best" $trim_args "$url"
            ;;
        17)
            echo -e "${GREEN}${MSG_${LANG}[opt17]}${NC}"
            urls=$(queue_downloads)
            for u in $urls; do
                progress_bar
                yt-dlp --no-mtime -o "$DOWNLOAD_PATH/%(title)s.%(ext)s" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best" "$u"
            done
            ;;
        18)
            echo -e "${GREEN}${MSG_${LANG}[opt18]}${NC}"
            progress_monitor "$url"
            ;;
        19)
            select_language
            menu
            download "$url"
            ;;
        20)
            echo -e "${RED}${MSG_${LANG}[opt20]} 🎸 Keep soaring through the cosmos!${NC}"
            notify "${MSG_${LANG}[opt20]}" "success"
            exit 0
            ;;
        *)
            echo -e "${RED}${MSG_${LANG}[invalid]}${NC}"
            notify "${MSG_${LANG}[invalid]}" "error"
            sleep 2
            menu
            ;;
    esac
}

# Main Execution
check_deps
ascii_art
spinner
menu
download "$1"

# Completion Message
echo -e "${GREEN}${MSG_${LANG}[done]}${NC}"
echo -e "${PURPLE}${MSG_${LANG}[thanks]}${NC}"
echo -e "${CYAN}🔥 Share your galactic journey and keep downloading! 🔥${NC}"
notify "${MSG_${LANG}[thanks]}" "success"
