# Installation Guide for YouTube AllRounder 6.0 🌌

This guide provides step-by-step instructions to install **YouTube AllRounder 6.0**, a galactic YouTube downloader for Termux, created by **Rajsaraswati Jatav**. Follow these steps to set up the script and start your cosmic downloading journey!

**Author**: Rajsaraswati Jatav  
**Repository**: [GitHub](https://github.com/RajsaraswatiJatav/YouTube-AllRounder)  
**Instagram**: [official_rajsaraswati_jatav](https://www.instagram.com/official_rajsaraswati_jatav/)  
**Version**: 6.0 (Released: June 2024)  

---

## 📋 Prerequisites

Before installing, ensure you have the following:

- **Termux**: Installed on Android from [F-Droid](https://f-droid.org/packages/com.termux/) (not Google Play Store, as it’s outdated).
- **Internet Connection**: Stable connection for downloading dependencies and cloning the repository.
- **Storage Access**: Permission to access `/sdcard` for saving downloaded files.
- **Sound Files** (Optional): WAV files (1-2 seconds) for sensory effects, downloadable from [Freesound](https://freesound.org/).

---

## 🛠️ Installation Steps

### Step 1: Install Termux Dependencies
Update Termux and install required packages (`python`, `ffmpeg`, `termux-api`, `git`) and the `yt-dlp` library.

```bash
pkg update -y && pkg upgrade -y
pkg install python ffmpeg termux-api git -y
pip install --upgrade pip
pip install yt-dlp
