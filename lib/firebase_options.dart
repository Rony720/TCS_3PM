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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyBjsaPOL4GuM5iIo1YFM_z66tvrfmKm2Z8',
    appId: '1:259194176970:web:b3f089f97f223ab7887b33',
    messagingSenderId: '259194176970',
    projectId: 'physioplay-9e057',
    authDomain: 'physioplay-9e057.firebaseapp.com',
    storageBucket: 'physioplay-9e057.appspot.com',
    measurementId: 'G-SL0X55RJ3V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAidKMbqcFyMqFil4wpUEWwbDNL3udBzLc',
    appId: '1:259194176970:android:2e2db381c7cc8e53887b33',
    messagingSenderId: '259194176970',
    projectId: 'physioplay-9e057',
    storageBucket: 'physioplay-9e057.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIljH1J3uFR-NY-l2DcWChX_CiYYXVhd4',
    appId: '1:259194176970:ios:151f9edb87fd8c9d887b33',
    messagingSenderId: '259194176970',
    projectId: 'physioplay-9e057',
    storageBucket: 'physioplay-9e057.appspot.com',
    iosClientId: '259194176970-kc1dgt557ds190na3u4j0msvf6qtjrbv.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAuthPage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIljH1J3uFR-NY-l2DcWChX_CiYYXVhd4',
    appId: '1:259194176970:ios:151f9edb87fd8c9d887b33',
    messagingSenderId: '259194176970',
    projectId: 'physioplay-9e057',
    storageBucket: 'physioplay-9e057.appspot.com',
    iosClientId: '259194176970-kc1dgt557ds190na3u4j0msvf6qtjrbv.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAuthPage',
  );
}
