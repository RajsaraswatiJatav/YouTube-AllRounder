# Usage Guide for YouTube AllRounder 6.0 🌌

This guide explains how to use **YouTube AllRounder 6.0**, a galactic YouTube downloader for Termux, created by **Rajsaraswati Jatav**. Learn how to run the script, interact with its **20 advanced features**, and enjoy its **enhanced visuals** and **sensory enhancements** for a cosmic downloading experience!

**Author**: Rajsaraswati Jatav  
**Repository**: [GitHub](https://github.com/RajsaraswatiJatav/YouTube-AllRounder)  
**Instagram**: [official_rajsaraswati_jatav](https://www.instagram.com/official_rajsaraswati_jatav/)  
**Version**: 6.0 (Released: June 2024)  

---

## 🚀 Getting Started

After installing **YouTube AllRounder 6.0** (see `docs/installation.md`), you’re ready to download YouTube videos, playlists, and more with a **futuristic flair**. Follow these steps to use the script.

### Prerequisites
- **Termux**: Installed and set up with dependencies (`install.sh`).
- **YouTube URL**: A valid link to a YouTube video, playlist, or Short.
- **Storage Access**: Granted via `termux-setup-storage`.
- **Sound Files** (Optional): WAV files in `/sdcard/YouTubeAllRounder6/sounds/` for sensory effects.

---

## 🎮 How to Run the Script

1. **Share a YouTube Link**:
   - Open the YouTube app or website on your Android device.
   - Copy the link of a video, playlist, or Short (e.g., `https://www.youtube.com/watch?v=example`).
   - Share it to Termux via the **Share** option (select Termux from the share sheet).

2. **Alternatively, Run Manually**:
   - Open Termux and run the script with a YouTube URL:
     ```bash
     ~/bin/termux-url-opener https://www.youtube.com/watch?v=example
     ```

3. **What Happens Next**:
   - The script launches with a **3D-like ASCII animation** featuring **Rajsaraswati Jatav** branding.
   - A random **dynamic spinner** (-|\, Braille, squares) adds a mesmerizing loading effect.
   - You’re prompted to select a language (English or Hindi).
   - A menu displays **20 advanced features** for downloading, with vibrant colors and emojis (🌌, 🎥, 🎵, ✂️).

---

## 🌟 Interacting with the Script

### Language Selection
- Choose your preferred language:
  - **1) English**: Default, with sci-fi-themed messages.
  - **2) Hindi**: Fully translated for a desi cosmic vibe.
- Your choice is saved in `~/.yt_allrounder_lang` for future sessions.

### Feature Menu
After selecting a language, you’ll see a menu with **20 options**. Use numbers (1-20) to select a feature. Here’s a breakdown:

1. **🎬 Video (Custom Resolution & Format)**: Preview and select video formats (e.g., 1080p, 720p).
2. **📺 Video (720p Hyper Mode)**: Quick download in 720p with best audio.
3. **🎵 Audio Only (MP3/AAC/M4A)**: Extract audio in your chosen format.
4. **📋 Entire Playlist**: Download all videos in a playlist, organized by title.
5. **📜 Video with Subtitles**: Embed subtitles (e.g., English, Hindi) in the video.
6. **📡 Live Stream Capture**: Record live YouTube streams.
7. **🖼️ Download Thumbnail (HQ)**: Save the video’s high-quality thumbnail.
8. **ℹ️ Extract Metadata (JSON)**: Save video metadata (title, duration, etc.) as JSON.
9. **📁 Custom File Naming**: Specify a custom filename for the download.
10. **📦 Batch URL Download**: Download multiple URLs at once.
11. **📱 YouTube Shorts Mode**: Optimized for Shorts with unique naming.
12. **⚡ Speed Limit Download**: Restrict download speed (e.g., 500KB/s).
13. **🔒 Proxy Download**: Use a proxy to bypass geo-restrictions.
14. **⏰ Schedule Download**: Set a future time for the download (e.g., 14:30).
15. **🔄 Auto-Resume Downloads**: Retry failed downloads up to 10 times.
16. **✂️ Video Trimming**: Download a specific segment (e.g., 00:30-02:00).
17. **📋 Download Queue**: Add multiple URLs to process sequentially.
18. **📊 Real-Time Progress**: Monitor download progress with live percentage.
19. **🌐 Change Language**: Switch between English and Hindi mid-session.
20. **🚪 Exit**: Close the script with a cosmic farewell.

### Sensory Enhancements
During operation, you’ll experience:
- **Dynamic Toasts**: Pop-ups at the top of the screen (black background, white text) for status updates.
- **Custom Vibrations**:
  - 100ms: Start of an action.
  - 150ms: General notifications.
  - 200ms: Successful completion.
  - 400ms: Errors.
- **Sound Effects**: If WAV files are set up in `/sdcard/YouTubeAllRounder6/sounds/`:
  - `start.wav`: Download begins.
  - `success.wav`: Download completes.
  - `error.wav`: Error occurs.
  - `notify.wav`: General alerts.

### Output Location
All downloaded files (videos, audio, thumbnails, metadata) are saved to `/sdcard/YouTubeAllRounder6/`, organized by title or playlist.

---

## 📋 Example Usage

### Download a 720p Video
```bash
~/bin/termux-url-opener https://www.youtube.com/watch?v=example
