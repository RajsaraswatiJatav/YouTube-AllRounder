# YouTube AllRounder 2024 🌌️

![GitHub](https://github.com/Rajasaraswati/YouTube-AllRounder/blob/main/images/YouTube-AllRounder.png?raw=true)

**A Galactic YouTube Downloader for Termux with Mind-Bending Features & Sensory Spectacle!**

**Author**: Rajsaraswati Jatav  
**GitHub**: [RajsaraswatiJatav/YouTube-AllRounder](https://github.com/RajsaraswatiJatav/YouTube-AllRounder)  
**License**: MIT License  
**Instagram**: [official_rajsaraswati_jatav](https://www.instagram.com/official_rajsaraswati_jatav/)  
**Version**: 6.0.2024 (Released: June 30, 2024)  

---

## 🚀 About

**YouTube AllRounder 6.0** is the ultimate YouTube downloader script for **Termux**, designed to deliver a **futuristic, immersive experience** on Android devices. Powered by **yt-dlp**, it combines **20 advanced features** like video trimming, download scheduling, real-time progress monitoring, and batch downloading with **3D-like ASCII animations**, **vibrant UI**, **custom vibrations**, and **sound effects**. Supporting **English** and **Hindi** (with placeholders for Tamil/Telugu), this script transforms YouTube downloading into a **cosmic sci-fi adventure**!

---

## 🌟 Key Features

### 🎨 Enhanced Visuals
- **3D-Like ASCII Animations**: Pulsing, multi-frame ASCII art for a holographic sci-fi vibe.
- **Dynamic Multi-Style Spinner**: Randomly cycles through spinners (-|\, Braille, squares) for mesmerizing loading.
- **Animated Progress Bar**: Smooth progress bar with percentage display.
- **Vibrant Colors**: Red, Green, Yellow, Blue, Cyan, Purple, White with emojis (🌌, 🚀, 🎥, 🎵, 🔥, ✂️).

### 🛠️ Advanced Features
- **Custom Resolution & Format**: Preview and select video/audio formats with `yt-dlp`.
- **Video Trimming**: Download specific video segments (e.g., 00:30-02:00).
- **Download Scheduling**: Schedule downloads for a specific time (e.g., 14:30).
- **Real-Time Progress**: Monitor download progress with live percentage display.
- **Download Queue**: Add multiple URLs to process sequentially.
- **Batch Downloads**: Download multiple URLs in one go.
- **YouTube Shorts Mode**: Optimized for Shorts with unique naming.
- **Speed Limiting**: Control bandwidth (e.g., 500KB/s).
- **Proxy Support**: Bypass geo-restrictions with custom proxies.
- **Auto-Resume**: Retry failed downloads up to 10 times.
- **Audio Formats**: MP3, AAC, or M4A audio extraction.
- **Comprehensive YouTube Support**: Videos, playlists, subtitles, live streams, thumbnails, metadata (JSON).

### 🔊 Sensory Enhancements
- **Dynamic Toasts**: Top-screen pop-ups with black background and white text.
- **Custom Vibrations**: 100ms (start), 150ms (notify), 200ms (success), 400ms (error).
- **Sound Effects**: Plays `start.wav`, `success.wav`, `error.wav`, `notify.wav` for different actions.

### 🌐 Multi-Language Support
- **English & Hindi**: Fully translated menus and messages.
- **Persistent Settings**: Language choice saved in `~/.yt_allrounder_lang`.
- **Extendable**: Placeholders for Tamil, Telugu, and more.

### 📱 Termux-Optimized
- Lightweight, fast, and mobile-friendly.
- Files saved to `/sdcard/YouTubeAllRounder6`.

---

## 📋 Prerequisites

- **Termux**: Install from [F-Droid](https://f-droid.org/packages/com.termux/) (not Play Store).
- **Internet Connection**: Stable connection for downloading.
- **Storage Permission**: Grant with `termux-setup-storage`.
- **Sound Files** (Optional): WAV files for sensory effects (1-2 second clips).

---

## 🛠️ Installation

### Step 1: Setup Termux
```bash
pkg update -y && pkg upgrade -y
pkg install python ffmpeg termux-api git -y
pip install --upgrade pip
pip install yt-dlp
termux-setup-storage
