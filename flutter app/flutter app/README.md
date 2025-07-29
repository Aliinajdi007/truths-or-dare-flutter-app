# Truth or Dare Spinner

A fun offline Flutter game for friends! Spin the wheel to pick a player, then challenge them with a random Truth or Dare. Perfect for parties, road trips, or any group hangout.

---

## 🎯 Features
- Add 2–8 players
- Animated spinner wheel to randomly select a player
- Truth or Dare challenge selection
- Random challenge display
- Next turn/round support
- Light & dark mode toggle
- Modern, colorful UI
- Fully offline (no internet required)

---

## 🧩 Folder Structure
```
lib/
├── main.dart
├── screens/
│   ├── home_screen.dart
│   ├── player_setup_screen.dart
│   ├── spin_screen.dart
│   └── challenge_screen.dart
├── widgets/
│   ├── spinner_wheel.dart
│   ├── player_list.dart
│   └── challenge_card.dart
├── models/
│   ├── player.dart
│   └── challenge.dart
├── data/
│   └── truth_dare_data.dart
└── utils/
    └── theme.dart
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- Device or emulator for testing

### Setup
1. **Clone or download this repository.**
2. Open a terminal in the project root.
3. Run:
   ```
   flutter pub get
   flutter run
   ```

---

## 🕹️ How to Play
1. Add player names (2–8 players).
2. Tap "Start Game".
3. Tap the spinner wheel to randomly select a player.
4. The selected player chooses "Truth" or "Dare".
5. A random challenge appears. Complete it!
6. Tap "Next Turn" to spin again.
7. Toggle light/dark mode with the floating button.

---

## 💡 Customization
- Add more truths/dares in `lib/data/truth_dare_data.dart`.
- Change colors and fonts in `lib/utils/theme.dart`.
- Extend with categories, timers, or custom challenges as you wish!

---

## 🤝 Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.
<img width="1536" height="1024" alt="1111" src="https://github.com/user-attachments/assets/b3036b07-6572-4a96-9e38-20199f6c90b0" />

---

## 📄 License
This project is open source and free to use for any purpose. 
