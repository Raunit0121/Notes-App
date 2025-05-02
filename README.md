# 📚 Flutter Notes App 📝

A simple and clean **Notes Management** application built with **Flutter** and **Firebase Firestore**. This app allows users to **add notes, view all notes, update or delete notes,** and **sync with Firebase in real-time**.

---

## 📸 Screenshots

|Splash Screen | Home Screen | Add Note Screen |
|:------------|:----------------|:----------------|
|(![Screenshot 2025-05-02 141718](https://github.com/user-attachments/assets/48248cd8-e6d6-467b-ac77-6b8924b23fd2) |(![Screenshot 2025-05-02 141550](https://github.com/user-attachments/assets/6026d782-e5c0-4a59-b5e0-e3a27db074d4)|(![Screenshot 2025-05-02 141620](https://github.com/user-attachments/assets/2c9ad7d7-88ed-459e-83e8-163818fd391a)

---

## 🚀 Features

- 🔥 **Firebase Firestore Integration**
- 📖 Add new notes (Title, Content)
- 📋 View all notes in a real-time list
- 📝 Edit and update notes
- ❌ Delete notes
- 📱 Responsive and clean UI
- ⚙️ Real-time updates via `StreamBuilder`

---

## 📦 Tech Stack

- **Flutter**
- **Dart**
- **Firebase Firestore**
- **Firebase Core**

---

## 📂 Project Structure

lib/
├── main.dart
├── firebase_options.dart
├── splash_screen.dart
├── home_page.dart
└── note_editor_page.dart



---

## 🔧 Setup Instructions

1. 🔥 Create a project on [Firebase Console](https://console.firebase.google.com/)
2. Add your Android/iOS app
3. Download `google-services.json` and place it inside `android/app/`
4. Download `GoogleService-Info.plist` for iOS and add it to the Xcode project
5. Update your `android/build.gradle` and `android/app/build.gradle` as per the Firebase setup guide
6. Run:
   ```bash
   flutter pub get
   flutter run


   
  ---

## 🔧 Firebase Firestore Rules
Make sure your Firestore rules (for testing) are:

service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}

