import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA6SUip_6pApWWNBxXgENB6GjALFAfvDZc",
            authDomain: "balance-832df.firebaseapp.com",
            projectId: "balance-832df",
            storageBucket: "balance-832df.appspot.com",
            messagingSenderId: "476466007563",
            appId: "1:476466007563:web:4379445c6b7ab22edac10e",
            measurementId: "G-Y0LK7S7F51"));
  } else {
    await Firebase.initializeApp();
  }
}
