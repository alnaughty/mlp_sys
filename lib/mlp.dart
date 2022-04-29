import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mlp_sys/globals/routes.dart';
import 'package:mlp_sys/splash_screen.dart';

class MLPApp extends StatelessWidget {
  const MLPApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MLP APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade100,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: const SplashScreen(),
      onGenerateRoute: route,
    );
  }
}
