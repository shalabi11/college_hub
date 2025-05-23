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
    apiKey: 'AIzaSyB848MJlKRIyCayhAEeH3Qan-5Sy5YaIww',
    appId: '1:517496198171:web:84439760ff087792fcd4be',
    messagingSenderId: '517496198171',
    projectId: 'college-hub-524cb',
    authDomain: 'college-hub-524cb.firebaseapp.com',
    storageBucket: 'college-hub-524cb.firebasestorage.app',
    measurementId: 'G-PHGN6ZJX5M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtOVrZULm9DOG1R8bUh7VrtXHWLzGmjuo',
    appId: '1:517496198171:android:d43ff7da766b0b48fcd4be',
    messagingSenderId: '517496198171',
    projectId: 'college-hub-524cb',
    storageBucket: 'college-hub-524cb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB69z-pZP3rRNe5iNIwCms_IHumJRWEvic',
    appId: '1:517496198171:ios:70067ab28783f84afcd4be',
    messagingSenderId: '517496198171',
    projectId: 'college-hub-524cb',
    storageBucket: 'college-hub-524cb.firebasestorage.app',
    iosBundleId: 'com.example.collegeHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB69z-pZP3rRNe5iNIwCms_IHumJRWEvic',
    appId: '1:517496198171:ios:70067ab28783f84afcd4be',
    messagingSenderId: '517496198171',
    projectId: 'college-hub-524cb',
    storageBucket: 'college-hub-524cb.firebasestorage.app',
    iosBundleId: 'com.example.collegeHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB848MJlKRIyCayhAEeH3Qan-5Sy5YaIww',
    appId: '1:517496198171:web:987950a99304fca5fcd4be',
    messagingSenderId: '517496198171',
    projectId: 'college-hub-524cb',
    authDomain: 'college-hub-524cb.firebaseapp.com',
    storageBucket: 'college-hub-524cb.firebasestorage.app',
    measurementId: 'G-Y8E18QRD7Z',
  );
}
