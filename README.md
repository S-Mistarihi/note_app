# 📝 Note App

<h3 align="center">
A modern Flutter note-taking application with customizable notes, multilingual support, and efficient local data persistence.
</h3>


<p align="center">

<img src="https://img.shields.io/badge/Flutter-Framework-blue?style=for-the-badge&logo=flutter">

<img src="https://img.shields.io/badge/Dart-Language-blue?style=for-the-badge&logo=dart">

<img src="https://img.shields.io/badge/Hive-Local%20Database-orange?style=for-the-badge">

<img src="https://img.shields.io/badge/Localization-Multi%20Language-green?style=for-the-badge">

</p>


---

# 📌 Overview

**Note App** is a Flutter application designed to provide users with a simple and efficient way to create, organize, and manage their notes.

The application provides:

- **Complete note management**
- **Customizable note appearance**
- **Dark & Light themes**
- **Multi-language support**
- **Local data persistence**

The project focuses on implementing Flutter development concepts such as **local storage**, **localization**, **theme persistence**, and **user preferences management**.

---

# ✨ Features

## 📝 Note Management

✔ **Create** new notes  
✔ **View** notes details  
✔ **Update** existing notes  
✔ **Delete** notes  
✔ **Pin / Unpin** important notes  


---

## 🔍 Search & Sorting

✔ Search notes by **title**

✔ Organize notes using:

- **Newest first**
- **Oldest first**
- **Alphabetical order**


---

## 🎨 Customization

✔ Select a custom color for each note

✔ Modify note colors anytime

✔ Support:

- **Light Theme**
- **Dark Theme**


---

## 🌍 Localization

### **Flutter Localization**

Used to provide multilingual support for:

- English 🇺🇸
- Arabic 🇸🇦
- French 🇫🇷


### **Scoped Model**

Used specifically for localization state management:

- Managing current locale
- Notifying UI about language changes
- Connecting localization changes with the application state


---

# 🛠 Tech Stack


## 📱 Framework

**Flutter**

A UI toolkit used to build cross-platform applications with a single codebase.


---

## 💻 Programming Language

**Dart**

The programming language used for Flutter development.


---

## 🗄 Local Database

### **Hive**

Fast and lightweight NoSQL local database.

Used for:

- Storing notes
- Updating notes
- Deleting notes
- Retrieving notes


---

---

## 💾 User Preferences

### **Shared Preferences**

Used to store user settings:

- Selected theme
- Selected language

The preferences are restored automatically when reopening the application.


---

# 📱 Screenshots

## 🌙 Dark Mode/English language selected

| | | | | |
|---|---|---|---|---|
| <img src="screenshots/dark_theme/1_splash.gif" width="150"> | <img src="screenshots/dark_theme/2_home_with_no_data.gif" width="150"> | <img src="screenshots/dark_theme/3_add_note.png" width="150"> | <img src="screenshots/dark_theme/4_view_note.png" width="150"> | <img src="screenshots/dark_theme/5_edit_note_and_make_pinned.png" width="150"> |
| <img src="screenshots/dark_theme/6_view_note_after_pin.png" width="150"> | <img src="screenshots/dark_theme/7_view_oldest_order.png" width="150"> | <img src="screenshots/dark_theme/8_search_with_no_result.png" width="150"> | <img src="screenshots/dark_theme/9_search_with_result.png" width="150"> | <img src="screenshots/dark_theme/10_delete" width="150"> |
| <img src="screenshots/dark_theme/11_confrim_delete.png" width="150"> | <img src="screenshots/dark_theme/12_setting.png" width="150"> | <img src="screenshots/dark_theme/13_select_language.png" width="150"> | | |

---

## ☀️ Light Mode//English language selected

| | | | | |
|---|---|---|---|---|
| <img src="screenshots/light_theme/1_splash.gif" width="150"> | <img src="screenshots/light_theme/2_home_with_no_data.png" width="150"> | <img src="screenshots/light_theme/3_add_note.png" width="150"> | <img src="screenshots/light_theme/4_view_note.png" width="150"> | <img src="screenshots/light_theme/5_edit_note_and_make_pinned.png" width="150"> |
| <img src="screenshots/light_theme/6_view_note_after_pin.png" width="150"> | <img src="screenshots/light_theme/7_view_oldest_order.png" width="150"> | <img src="screenshots/light_theme/8_search_with_no_result.png" width="150"> | <img src="screenshots/light_theme/9_search_with_result.png" width="150"> | <img src="screenshots/light_theme/10_delete" width="150"> |
| <img src="screenshots/light_theme/11_confrim_delete.png" width="150"> | <img src="screenshots/light_theme/12_setting.png" width="150"> | <img src="screenshots/light_theme/13_select_language.png" width="150"> | | |


---

# 🚀 Installation


### 1️⃣ Clone Repository

```bash
git clone https://github.com/your_username/note_app.git
```


### 2️⃣ Install Packages

```bash
flutter pub get
```


### 3️⃣ Run Application

```bash
flutter run
```


---

# 📦 Dependencies


| Package | Purpose |
|---|---|
| **Hive** | Local database |
| **Hive Flutter** | Hive integration with Flutter |
| **Shared Preferences** | Store user settings |
| **Scoped Model** | State management |
| **Flutter Localization** | Multi-language support |
| **Intl** | Internationalization |


---

# 🔮 Future Improvements

- Add image, audio, and PDF attachments
- Add reminders and notifications
- Add cloud synchronization
- Add authentication


---

## 👤 Author
**Sara AL-Mistarihi**  
Computer Engineering | Junior Flutter Developer   

⭐ If you like this project, don't forget to give it a star!
---
