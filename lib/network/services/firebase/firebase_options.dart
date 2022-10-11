import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzCrlxu3hy-lpGJP9qcF6i4Y7dqS5Eask',
    appId: '1:1047696543764:android:00cf02e115e63330fb9701',
    messagingSenderId: '1047696543764',
    projectId: 'pride-of-cows-poc',
    storageBucket: 'pride-of-cows-poc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzCrlxu3hy-lpGJP9qcF6i4Y7dqS5Eask',
    appId: '1:1047696543764:android:00cf02e115e63330fb9701',
    messagingSenderId: '1047696543764',
    projectId: 'pride-of-cows-poc',
    storageBucket: 'pride-of-cows-poc.appspot.com',
    iosBundleId: 'pride-of-cows-poc',
    iosClientId: '____',
  );
}
