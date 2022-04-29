import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void windowInit() async {
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    // Hide window title bar
    await windowManager.setSize(const Size(1000, 800));
    await windowManager.setMinimumSize(const Size(400, 800));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
  });
}

const String apiKey = 'AIzaSyCwT8qegy36-zhQJ1axLJf2UAZ071s_z4k';
const String firebaseProjectId = 'malajog-park';
const String appId = '1:529697335306:web:c627248925bd6716fb57f3';
const String senderId = '529697335306';
