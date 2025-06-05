# 🧭 Reckit - Trip Management Dashboard

**Reckit** is a responsive Flutter web application designed to manage, visualize, and track travel itineraries and tasks. It features a dark, modern UI inspired by real-world dashboard layouts, supports mobile and desktop views, and dynamically loads content from a JSON source.

---

## ✨ Features

- 🌙 Beautiful dark-themed UI
- 📱 Fully responsive layout (mobile & web)
- 📦 JSON-powered dynamic trip listing
- 📅 Trip status, dates, tasks, and participants
- 🔧 Filter, sort, and add item buttons
- 🧑‍🤝‍🧑 Profile avatars and task counters

---

## 🚀 Live Demo

🌐 [View on GitHub Pages](https://agaafar7.github.io/Reckit/)

---

## 🛠️ Tech Stack

- [Flutter](https://flutter.dev) (Web)
- Dart
- Responsive layout with `MediaQuery`
- Local JSON asset loading
- GitHub Pages for deployment

---

## 📂 Project Structure

reckit/
├── assets/
│ ├── data/trips_mock.json # JSON data for trips
│ └── icons/filter.png # Custom icons
├── lib/
│ ├── main.dart # App entry point
│ ├── screens/home_screen.dart # Main dashboard UI
│ └── models/trip.dart # Trip model
├── build/web/ # Generated web build (after build)
├── README.md
└── pubspec.yaml

---

## 🧪 Run Locally

### Requirements

- Flutter SDK (3.10+)
- Dart

### Setup

```bash
git clone https://github.com/AGaafar7/Reckit.git
cd Reckit
flutter pub get
flutter run -d chrome

flutter build web

