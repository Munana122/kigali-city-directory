import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'dart:io' show Platform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCtVkvUKI0W8QMZZmiFyMNBOajxktTZfHw',
    appId: '1:498171720665:web:some-id',
    messagingSenderId: '498171720665',
    projectId: 'kigali-city-directory-72436',
    authDomain: 'kigali-city-directory-72436.firebaseapp.com',
    storageBucket: 'kigali-city-directory-72436.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtVkvUKI0W8QMZZmiFyMNBOajxktTZfHw',
    appId: '1:498171720665:android:43637c0599990332da5fc8',
    messagingSenderId: '498171720665',
    projectId: 'kigali-city-directory-72436',
    storageBucket: 'kigali-city-directory-72436.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtVkvUKI0W8QMZZmiFyMNBOajxktTZfHw',
    appId: '1:498171720665:ios:some-id',
    messagingSenderId: '498171720665',
    projectId: 'kigali-city-directory-72436',
    storageBucket: 'kigali-city-directory-72436.firebasestorage.app',
    iosBundleId: 'com.example.kigaliCityDirectory',
  );
}
