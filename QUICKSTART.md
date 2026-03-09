# Quick Start Guide

## Immediate Next Steps

### 1. Firebase Setup (CRITICAL - App won't work without this)

**A. Create Firebase Project:**
- Go to: https://console.firebase.google.com/
- Click "Add project"
- Name: "kigali-city-directory"
- Disable Google Analytics (optional)

**B. Enable Authentication:**
- In Firebase Console → Authentication → Get Started
- Sign-in method → Email/Password → Enable

**C. Create Firestore Database:**
- In Firebase Console → Firestore Database → Create database
- Start in test mode
- Choose location: us-central

**D. Add Android App:**
- Project Settings → Add app → Android
- Package name: `com.example.kigali_city_directory`
- Download `google-services.json`
- Place in: `android/app/google-services.json`

**E. Update Firebase Config:**
Edit `lib/firebase_options.dart` - replace ALL placeholders with values from Firebase Console → Project Settings:
- YOUR_ANDROID_API_KEY
- YOUR_ANDROID_APP_ID
- YOUR_PROJECT_ID
- YOUR_MESSAGING_SENDER_ID

### 2. Google Maps Setup (CRITICAL - Maps won't work without this)

**A. Get API Key:**
- Go to: https://console.cloud.google.com/
- Select your Firebase project
- APIs & Services → Credentials → Create Credentials → API Key
- Copy the API key

**B. Enable Maps SDK:**
- APIs & Services → Library
- Search "Maps SDK for Android" → Enable

**C. Add API Key:**
Edit `android/app/src/main/AndroidManifest.xml` line 13:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_ACTUAL_API_KEY_HERE"/>
```

### 3. Run the App

```bash
flutter run
```

## Test the App

1. **Sign Up**: Create account with email/password
2. **Add Location**: Tap FAB in "My Listings"
3. **Search**: Use search bar in Directory
4. **Filter**: Tap category chips
5. **View Map**: Navigate to Map tab
6. **Settings**: Check profile and logout

## Default Test Data

Use these coordinates for Kigali locations:
- Kigali Convention Centre: -1.9536, 30.0927
- Kigali City Tower: -1.9536, 30.0606
- Kigali Genocide Memorial: -1.9441, 30.0894
- Kimironko Market: -1.9403, 30.1261

## Troubleshooting

**Build fails?**
```bash
flutter clean
flutter pub get
flutter run
```

**Firebase error?**
- Check `google-services.json` is in `android/app/`
- Verify package name matches in Firebase Console

**Maps not showing?**
- Verify API key in AndroidManifest.xml
- Check Maps SDK is enabled
- Ensure billing is enabled in Google Cloud

## File Locations

- Firebase config: `lib/firebase_options.dart`
- Google Maps key: `android/app/src/main/AndroidManifest.xml` (line 13)
- Firebase JSON: `android/app/google-services.json`

## Categories Available

- Hospital
- School
- Restaurant
- Hotel
- Cafe Park
- Tourist Attraction

## Support

Check SETUP.md for detailed instructions.
