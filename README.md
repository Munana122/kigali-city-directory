# Kigali City Directory

A Flutter mobile application for discovering and managing locations in Kigali, Rwanda. Features include Firebase authentication, real-time location management, Google Maps integration, and advanced search/filtering capabilities.

## Features

- 🔐 **Authentication**: Email/password login and registration
- 📍 **Location Management**: Full CRUD operations for locations
- 🔍 **Search & Filter**: Search by name/category with real-time results
- 🗺️ **Maps Integration**: View locations on Google Maps
- 📱 **Bottom Navigation**: Easy navigation between Directory, Listings, Map, and Settings
- ⚙️ **Settings**: User profile and notification preferences

## Tech Stack

- **Framework**: Flutter
- **State Management**: Provider
- **Backend**: Firebase (Authentication + Firestore)
- **Maps**: Google Maps Flutter
- **Language**: Dart

## Quick Start

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Setup Firebase**:
   - Create project at https://console.firebase.google.com/
   - Download `google-services.json` to `android/app/`
   - Update `lib/firebase_options.dart` with your config

3. **Setup Google Maps**:
   - Get API key from https://console.cloud.google.com/
   - Add to `android/app/src/main/AndroidManifest.xml`

4. **Run**:
   ```bash
   flutter run
   ```

## Detailed Setup

See [SETUP.md](SETUP.md) for complete setup instructions.

## Project Structure

```
lib/
├── models/          # Data models
├── providers/       # State management
├── screens/         # UI screens
├── services/        # Business logic
└── main.dart        # App entry point
```

## Screenshots

(Add screenshots of your app here after running)

## Assignment Requirements

This project fulfills all requirements:
- ✅ Firebase Authentication
- ✅ Location CRUD with Firestore
- ✅ Search and filtering
- ✅ Google Maps integration
- ✅ State management (Provider)
- ✅ Bottom navigation
- ✅ Settings screen

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)

## License

This project is for educational purposes.
