import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:mlp_sys/globals/config.dart';
import 'package:flutter/material.dart';
import 'package:mlp_sys/mlp.dart';
import 'package:firedart/firedart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux) {
    Firestore.initialize(firebaseProjectId);
    FirebaseAuth.initialize(apiKey, VolatileStore());
    windowInit();
  } else {
    await Future.delayed(const Duration(seconds: 3));
    await Firebase.initializeApp()
        .whenComplete(() => print("FIREBASE HAS BEEN INITIALIZED"));
    if (Platform.isMacOS) {
      windowInit();
    }
  }
  runApp(const MLPApp());
}
