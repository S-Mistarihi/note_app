# 📝 Note App

A feature-rich Flutter note-taking application built with **Hive**, **Shared Preferences**, and **Flutter Localization**, providing customizable notes, theme switching, and multilingual support.

---

# 📌 Features

## 📝 Notes Management

- Create, view, update, and delete notes
- Pin and unpin important notes
- Customize note colors
- Edit note appearance anytime

---

## 🔍 Search & Sorting

- Search notes by title
- Sort notes by:
  - Newest
  - Oldest
  - Alphabetical order

---

## 🎨 Themes & Localization

- Support **Light Mode** and **Dark Mode**
- Support multiple languages:
  
  | Language | Locale |
  | -------- | ------ |
  | English  | `en`   |
  | Arabic   | `ar`   |
  | French   | `fr`   |

  Implemented using:
    - **`flutter_localizations`**
    - **`intl`**
    - **`scoped_model`** for localization state management
  
---

# 💾 Local Storage

### **Hive**

Used as a local NoSQL database for:

- Storing notes
- Updating notes
- Deleting notes
- Retrieving notes


### **Shared Preferences**

Used to persist user preferences:

- Selected theme
- Selected language
- User preferences between application sessions

---

# 🛠 Tech Stack

| Technology | Usage |
|---|---|
| `flutter` | Cross-platform application development |
| `dart` | Programming language |
| `hive` | Local database |
| `hive_flutter` | Hive integration with Flutter |
| `shared_preferences` | Store user settings |
| `flutter_localizations` | Localization support |
| `scoped_model` | Localization state management |
| `intl` | Internationalization |

---

# 📱 Screenshots

## 🌙 Dark Mode - English Language

| | | | | |
|---|---|---|---|---|
| <img src="asset/screenshots/dark_theme/1_splash.gif" width="150"> | <img src="asset/screenshots/dark_theme/2_home_with_no_data.gif" width="150"> | <img src="asset/screenshots/dark_theme/3_add_note.png" width="150"> | <img src="asset/screenshots/dark_theme/4_view_note.png" width="150"> | <img src="asset/screenshots/dark_theme/5_edit_note_and_make_pinned.png" width="150"> |
| <img src="asset/screenshots/dark_theme/6_view_note_after_pin.png" width="150"> | <img src="asset/screenshots/dark_theme/7_view_oldest_order.png" width="150"> | <img src="asset/screenshots/dark_theme/8_search_with_no_result.png" width="150"> | <img src="asset/screenshots/dark_theme/9_search_with_result.png" width="150"> | <img src="asset/screenshots/dark_theme/10_delete.png" width="150"> |
| <img src="asset/screenshots/dark_theme/11_confrim_delete.png" width="150"> | <img src="asset/screenshots/dark_theme/12_setting.png" width="150"> | <img src="asset/screenshots/dark_theme/13_select_language.png" width="150"> | | |

---

## ☀️ Light Mode - Arabic Language 

| | | | | |
|---|---|---|---|---|
| <img src="asset/screenshots/light_theme/1_splash.gif" width="150"> | <img src="asset/screenshots/light_theme/2_home_with_no_data.png" width="150"> | <img src="asset/screenshots/light_theme/3_add_note.png" width="150"> | <img src="asset/screenshots/light_theme/4_view_note.png" width="150"> | <img src="asset/screenshots/light_theme/5_edit_note_and_make_pinned.png" width="150"> |
| <img src="asset/screenshots/light_theme/6_view_note_after_pin.png" width="150"> | <img src="asset/screenshots/light_theme/7_view_zToa_order.png" width="150"> | <img src="asset/screenshots/light_theme/8_search_with_no_result.png" width="150"> | <img src="asset/screenshots/light_theme/9_search_with_result.png" width="150"> | <img src="asset/screenshots/light_theme/10_delete.png" width="150"> |
| <img src="asset/screenshots/light_theme/11_confirm_delete.png" width="150"> | <img src="asset/screenshots/light_theme/12_setting.png" width="150"> | <img src="asset/screenshots/light_theme/13_select_language.png" width="150"> | | |


---

# 🚀 Installation


### 1️⃣ Clone Repository

```bash
git clone git@github.com:S-Mistarihi/note_app.git
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

# 🔮 Future Improvements

- Add cloud backup and synchronization
- Add reminders and notifications
- Add attachments support (Images, Audio, PDF)


---

## 👤 Author

**Sara AL-Mistarihi**  

Computer Engineering | Junior Flutter Developer   

GitHub:  
https://github.com/S-Mistarihi

---
