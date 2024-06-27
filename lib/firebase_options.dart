// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC55w6RNL6ijckZzPvbJ1tOUxrJClkNDYU',
    appId: '1:212336933547:web:aaf03feec6df536255d5ee',
    messagingSenderId: '212336933547',
    projectId: 'camerin-33b4a',
    authDomain: 'camerin-33b4a.firebaseapp.com',
    storageBucket: 'camerin-33b4a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDi5nE_arVkXN53P5V2qbi1Tp6l5lFJSKM',
    appId: '1:212336933547:android:c5d981ccac08f60c55d5ee',
    messagingSenderId: '212336933547',
    projectId: 'camerin-33b4a',
    storageBucket: 'camerin-33b4a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMD9P8wvE-NVOv9IpchjE031G0q5le_1w',
    appId: '1:212336933547:ios:5d7c1f312b926aa855d5ee',
    messagingSenderId: '212336933547',
    projectId: 'camerin-33b4a',
    storageBucket: 'camerin-33b4a.appspot.com',
    iosBundleId: 'com.example.assignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMD9P8wvE-NVOv9IpchjE031G0q5le_1w',
    appId: '1:212336933547:ios:5d7c1f312b926aa855d5ee',
    messagingSenderId: '212336933547',
    projectId: 'camerin-33b4a',
    storageBucket: 'camerin-33b4a.appspot.com',
    iosBundleId: 'com.example.assignment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC55w6RNL6ijckZzPvbJ1tOUxrJClkNDYU',
    appId: '1:212336933547:web:d7c3d567044a8cec55d5ee',
    messagingSenderId: '212336933547',
    projectId: 'camerin-33b4a',
    authDomain: 'camerin-33b4a.firebaseapp.com',
    storageBucket: 'camerin-33b4a.appspot.com',
  );
}