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
    apiKey: 'AIzaSyBL0YTImf18UFOtwiLkHTbefyew3X5e0sI',
    appId: '1:733835765275:web:8fbe2d7a00535f80bdfabe',
    messagingSenderId: '733835765275',
    projectId: 'unikonnect-3e69a',
    authDomain: 'unikonnect-3e69a.firebaseapp.com',
    storageBucket: 'unikonnect-3e69a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxBltIIsfhJYy5Fy3c1P8GnudHap6AsTc',
    appId: '1:733835765275:android:f59556e3adb87188bdfabe',
    messagingSenderId: '733835765275',
    projectId: 'unikonnect-3e69a',
    storageBucket: 'unikonnect-3e69a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbfmtBjU6gySTAZo_Y9ujY0AN98cQewiQ',
    appId: '1:733835765275:ios:7b0adb1304786994bdfabe',
    messagingSenderId: '733835765275',
    projectId: 'unikonnect-3e69a',
    storageBucket: 'unikonnect-3e69a.appspot.com',
    iosBundleId: 'com.example.eventhub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbfmtBjU6gySTAZo_Y9ujY0AN98cQewiQ',
    appId: '1:733835765275:ios:7b0adb1304786994bdfabe',
    messagingSenderId: '733835765275',
    projectId: 'unikonnect-3e69a',
    storageBucket: 'unikonnect-3e69a.appspot.com',
    iosBundleId: 'com.example.eventhub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBL0YTImf18UFOtwiLkHTbefyew3X5e0sI',
    appId: '1:733835765275:web:0704b569fc32a6d2bdfabe',
    messagingSenderId: '733835765275',
    projectId: 'unikonnect-3e69a',
    authDomain: 'unikonnect-3e69a.firebaseapp.com',
    storageBucket: 'unikonnect-3e69a.appspot.com',
  );
}
