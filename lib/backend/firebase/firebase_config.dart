import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCMj6E3MSQXlVigcn3peNj4nNVpaKm1p2U",
            authDomain: "network-95864.firebaseapp.com",
            projectId: "network-95864",
            storageBucket: "network-95864.firebasestorage.app",
            messagingSenderId: "221875789896",
            appId: "1:221875789896:web:d36707164c320245aaf87d"));
  } else {
    await Firebase.initializeApp();
  }
}
