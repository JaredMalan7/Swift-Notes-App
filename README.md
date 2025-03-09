# 📝 Swift Notes App

## Overview
Swift Notes App is a simple and intuitive note-taking application developed using Swift and SwiftUI with SwiftData for persistent storage. Users can:

1. Create new notes.
2. View existing notes.
3. Edit notes with a smooth transition.
4. Delete notes.

The app is designed to provide a seamless and user-friendly experience, allowing users to focus on writing notes without distractions.

---
### [YouTube Video Demo](https://youtu.be/-vv8y8dl7NA)

---

## 🛠 Installation and Setup
### **Requirements**
- macOS with Xcode installed (Download on the App Store)
- Swift 5+
- SwiftUI framework

### Installation Steps
1. Clone the Repository
   ```bash
   git clone https://github.com/JaredMalan7/Swift-Notes-App.git
   cd Swift-Notes-App


2. Open tge Project in Xcode
   1.	Open Xcode
   2.	Select File > Open
   3.	Navigate to the SwiftNotesApp directory and open SwiftNotesApp.xcodeproj


3. Run the App
    1.	Choose an iOS Simulator (or your actual iPhone if connected).
    2.	Click ▶️ Run in Xcode.

## 📲 App features
### Core Features

* Add Notes: Create new notes instantly. 📄
* Read Notes: View saved notes in a structured layout. 📖
* Edit Notes: Modify existing notes with an editable mode. ✏️
* Delete Notes: Remove notes with a swipe-to-delete gesture. 🗑

### Stretch Challenges
* Smooth Transitions when switching between view mode and edit mode. 🔄
* Clean UI with well-structured spacing and typography. 🎨
* Persistent Storage using SwiftData, so notes are saved even after the app is closed 📂

## 🔧 Code Structure

```bash
/SwiftNotesApp
│── SwiftNotesAppApp.swift    # Main entry point of the app
│── ContentView.swift         # Main UI screen (list of notes, add notes)
│── NoteDetailView.swift      # Displays note details and enables editing
│── Models/
│   ├── Note.swift            # Data model for storing notes
│── Assets/                   # Icons and images
│── README.md                 # Project documentation
````

## 📚 Useful Resources

* [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
* [SwiftData Guide](https://developer.apple.com/documentation/swiftdata)
* [Navigation in SwiftUI](https://developer.apple.com/documentation/swiftui/navigationstack)
* [Building iOS Apps with Xcode](https://developer.apple.com/xcode/)
* [SwiftUI TextEditor](https://developer.apple.com/documentation/swiftui/texteditor)

## 🏆 Possible Future Enhancements

* Search Feature – Allow users to search for notes
* Dark Mode Support – Auto-adapt UI for dark mode
* Cloud Syncing – Save notes to iCloud