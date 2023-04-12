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
    apiKey: 'AIzaSyARz1xlCtEjWvl72aaIpNl9NHa0vKGD8OQ',
    appId: '1:72755316809:web:e2dc5e10e3c1f75ac1d798',
    messagingSenderId: '72755316809',
    projectId: 'canajoy-1d3e7',
    authDomain: 'canajoy-1d3e7.firebaseapp.com',
    databaseURL: 'https://canajoy-1d3e7-default-rtdb.firebaseio.com',
    storageBucket: 'canajoy-1d3e7.appspot.com',
    measurementId: 'G-J152WX1QEP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjAFee3MLLatImaoIvEJc5GWrbUTIOrtw',
    appId: '1:72755316809:android:ea48352861136cbbc1d798',
    messagingSenderId: '72755316809',
    projectId: 'canajoy-1d3e7',
    databaseURL: 'https://canajoy-1d3e7-default-rtdb.firebaseio.com',
    storageBucket: 'canajoy-1d3e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSWgGq9bX8cI5ztwPwNfbE1NLOSmGyJFo',
    appId: '1:72755316809:ios:9c0f2f5a766fd206c1d798',
    messagingSenderId: '72755316809',
    projectId: 'canajoy-1d3e7',
    databaseURL: 'https://canajoy-1d3e7-default-rtdb.firebaseio.com',
    storageBucket: 'canajoy-1d3e7.appspot.com',
    iosClientId: '72755316809-ms79o9j7ie7mgjed5281ducffbrpep47.apps.googleusercontent.com',
    iosBundleId: 'com.example.juiceSales',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSWgGq9bX8cI5ztwPwNfbE1NLOSmGyJFo',
    appId: '1:72755316809:ios:9c0f2f5a766fd206c1d798',
    messagingSenderId: '72755316809',
    projectId: 'canajoy-1d3e7',
    databaseURL: 'https://canajoy-1d3e7-default-rtdb.firebaseio.com',
    storageBucket: 'canajoy-1d3e7.appspot.com',
    iosClientId: '72755316809-ms79o9j7ie7mgjed5281ducffbrpep47.apps.googleusercontent.com',
    iosBundleId: 'com.example.juiceSales',
  );
}
