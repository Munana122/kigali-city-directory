# Kigali City Directory - Setup Instructions

## Project Overview
A Flutter mobile application for managing and discovering locations in Kigali with Firebase Authentication, Firestore database, and Google Maps integration.

## Features Implemented
✅ Firebase Authentication (Email/Password)
✅ Location CRUD Operations
✅ Directory Search and Filtering
✅ Google Maps Integration
✅ State Management (Provider)
✅ Bottom Navigation
✅ Settings Screen

## Setup Steps

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Firebase Setup

#### Create Firebase Project
1. Go to https://console.firebase.google.com/
2. Create a new project named "kigali-city-directory"
3. Enable Authentication (Email/Password)
4. Create Firestore Database (Start in test mode)

#### Configure Firebase for Android
1. In Firebase Console, add Android app
2. Package name: `com.example.kigali_city_directory`
3. Download `google-services.json`
4. Place it in `android/app/` directory
5. Update `lib/firebase_options.dart` with your Firebase config values

#### Configure Firebase for iOS (Optional)
1. In Firebase Console, add iOS app
2. Bundle ID: `com.example.kigaliCityDirectory`
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory

### 3. Google Maps Setup

#### Get Google Maps API Key
1. Go to https://console.cloud.google.com/
2. Create/Select your project
3. Enable "Maps SDK for Android" and "Maps SDK for iOS"
4. Create API Key

#### Configure Google Maps
1. Open `android/app/src/main/AndroidManifest.xml`
2. Replace `YOUR_GOOGLE_MAPS_API_KEY` with your actual API key

For iOS, add to `ios/Runner/AppDelegate.swift`:
```swift
import GoogleMaps
GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY")
```

### 4. Update Firebase Options
Edit `lib/firebase_options.dart` and replace placeholder values:
- `YOUR_WEB_API_KEY`
- `YOUR_ANDROID_API_KEY`
- `YOUR_IOS_API_KEY`
- `YOUR_PROJECT_ID`
- `YOUR_APP_ID`
- `YOUR_MESSAGING_SENDER_ID`

### 5. Firestore Security Rules
In Firebase Console, set Firestore rules:
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /locations/{document} {
      allow read: if request.auth != null;
      allow create: if request.auth != null;
      allow update, delete: if request.auth != null && 
                               resource.data.createdBy == request.auth.uid;
    }
  }
}
```

### 6. Run the App
```bash
flutter run
```

## Project Structure
```
lib/
├── models/
│   ├── location_model.dart
│   └── user_model.dart
├── providers/
│   ├── auth_provider.dart
│   └── location_provider.dart
├── screens/
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   ├── home_screen.dart
│   ├── directory_screen.dart
│   ├── my_listings_screen.dart
│   ├── add_edit_location_screen.dart
│   ├── location_detail_screen.dart
│   ├── map_screen.dart
│   └── settings_screen.dart
├── services/
│   ├── auth_service.dart
│   └── firestore_service.dart
├── firebase_options.dart
└── main.dart
```

## Usage

### Authentication
1. Launch app → Login/Signup screen
2. Create account with email/password
3. Login to access main features

### Directory
- Browse all locations
- Search by name/category
- Filter by category chips
- Tap location to view details

### My Listings
- View your created locations
- Add new location (FAB button)
- Edit existing locations
- Delete locations

### Map View
- See all locations on Google Maps
- Tap markers to view details

### Settings
- View profile information
- Toggle notifications
- Logout

## Categories Available
- Hospital
- School
- Restaurant
- Hotel
- Cafe Park
- Tourist Attraction

## Default Coordinates (Kigali)
- Latitude: -1.9441
- Longitude: 30.0619

## Troubleshooting

### Firebase Issues
- Ensure `google-services.json` is in `android/app/`
- Check Firebase project settings match your package name
- Verify Authentication is enabled in Firebase Console

### Google Maps Issues
- Verify API key is correct in AndroidManifest.xml
- Ensure Maps SDK is enabled in Google Cloud Console
- Check billing is enabled for Google Cloud project

### Build Issues
```bash
flutter clean
flutter pub get
flutter run
```

## Next Steps for Production
1. Replace placeholder Firebase config with real values
2. Add Google Maps API key
3. Configure proper Firestore security rules
4. Add error handling and loading states
5. Implement image upload for locations
6. Add user profile management
7. Implement push notifications
8. Add location search with geocoding
9. Create app icons and splash screens
10. Test on physical devices

## Demo Credentials
After setup, create your own account through the signup screen.

## Support
For issues, refer to:
- Flutter docs: https://docs.flutter.dev/
- Firebase docs: https://firebase.google.com/docs
- Google Maps Flutter: https://pub.dev/packages/google_maps_flutter
