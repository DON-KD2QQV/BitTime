# BitTime - Binary Clock App for Android and Windows
[![Flutter CI](https://github.com/DON-KD2QQV/BitTime/actions/workflows/flutter.yml/badge.svg)](https://github.com/DON-KD2QQV/BitTime/actions/workflows/flutter.yml)
[![Release](https://github.com/DON-KD2QQV/BitTime/actions/workflows/release.yml/badge.svg)](https://github.com/DON-KD2QQV/BitTime/actions/workflows/release.yml)

Learn to read time in binary format with this educational and fun binary clock app! BitTime displays the current time using binary digits, helping you understand binary number systems while keeping track of time.

## 🕐 What is BitTime?

BitTime is a binary clock application that displays time using binary representation. Each digit of the time (hours, minutes, seconds) is shown in binary format using dots or blocks. It's perfect for:

- **Learning binary numbers** - Visual way to understand binary representation
- **Geek culture** - Show off your binary skills
- **Educational tool** - Great for students and educators
- **Unique timepiece** - Different way to display time

## ✨ Features

- 🔢 **Real-time binary clock display** - Live updating binary time
- 🎨 **Dark theme interface** - Easy on the eyes
- ❓ **Help dialog** - Learn how to read binary time
- 🌐 **Website integration** - Direct link to RadioOperator.net
- 📱 **Cross-platform** - Works on Android and Windows
- 🔄 **Auto-updating** - Time updates every second
- 🎯 **Clean UI** - Simple, focused design

## 📱 Installation

### Android
- **Google Play Store**: Search for "BitTime" (coming soon)
- **Direct APK**: Download from [Releases](https://github.com/DON-KD2QQV/BitTime/releases)

### Windows
- **From source**: Clone and build using Flutter

## 📸 Screenshots

Check out the `screenshots/` folder for app previews showing:
- Main binary clock display
- Help dialog explaining binary time
- Clean dark theme interface

## 🚀 Development

### Prerequisites
- Flutter SDK 3.24.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code
- Android SDK (for Android builds)

### Setup
```bash
# Clone the repository
git clone https://github.com/DON-KD2QQV/BitTime.git
cd BitTime

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Building
```bash
# Android APK
flutter build apk

# Android App Bundle (for Play Store)
flutter build appbundle

# Windows
flutter build windows
```

### Testing
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 🛠️ Technical Details

- **Framework**: Flutter 3.24.0
- **Language**: Dart
- **Platforms**: Android, Windows
- **Dependencies**: 
  - `url_launcher` - Website integration
  - `cupertino_icons` - iOS-style icons
- **Architecture**: StatefulWidget with Timer-based updates
- **Package ID**: `net.radiooperator.binaryclock`

## 📄 Privacy & Legal

- **Privacy Policy**: [View Privacy Policy](PRIVACY_POLICY.md)
- **License**: [MIT License](LICENSE)
- **Copyright**: © 2025 Donald Bryant (RadioOperator.net)

## 🤝 Contributing

Contributions are welcome! Please feel free to:
- Report bugs
- Suggest features
- Submit pull requests
- Improve documentation

## ☕ Support the Project

If you find BitTime useful and want to support its development:

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support%20development-orange?style=for-the-badge&logo=buy-me-a-coffee)](https://www.buymeacoffee.com/donaldbryas)

Your support helps maintain and improve BitTime for the ham radio and maker communities!

## 🔗 Links

- **RadioOperator.net**: [https://radiooperator.net](https://radiooperator.net)
- **GitHub Issues**: [Report bugs or request features](https://github.com/DON-KD2QQV/BitTime/issues)
- **Releases**: [Download latest version](https://github.com/DON-KD2QQV/BitTime/releases)

## 👨‍💻 Author

**Donald Bryant (KD2QQV)**
- GitHub: [@DON-KD2QQV](https://github.com/DON-KD2QQV)
- Website: [RadioOperator.net](https://radiooperator.net)
- Call Sign: KD2QQV

## 🎓 How to Read Binary Time

Binary time represents each digit of regular time in binary format:
- **Hours**: 0-23 (24-hour format)
- **Minutes**: 0-59
- **Seconds**: 0-59

Each decimal digit is converted to binary (4 bits), creating a visual pattern of dots or blocks. The app includes a built-in help system to teach you how to read it!

---

*Made with ❤️ by Donald Bryant for the ham radio and maker communities*
