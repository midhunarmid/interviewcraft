// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAxslyOrVhXT_48Y-i8YZOEv_A78fiKNPg',
    appId: '1:237835604840:web:8bfad2f4b9e29b0c4dfcdd',
    messagingSenderId: '237835604840',
    projectId: 'interviewcraft-e2f57',
    authDomain: 'interviewcraft-e2f57.firebaseapp.com',
    storageBucket: 'interviewcraft-e2f57.appspot.com',
    measurementId: 'G-60K5E219SV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfW2sPtNvQdnezkzYXLEr_4QW3__CFrTA',
    appId: '1:237835604840:android:608c50029aa672934dfcdd',
    messagingSenderId: '237835604840',
    projectId: 'interviewcraft-e2f57',
    storageBucket: 'interviewcraft-e2f57.appspot.com',
  );
}
