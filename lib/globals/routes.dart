import 'package:flutter/material.dart';
import 'package:mlp_sys/splash_screen.dart';
import 'package:mlp_sys/views/landing_page.dart';
import 'package:mlp_sys/views/landing_page_children/settings_page.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic>? Function(RouteSettings)? get route => (settings) {
      switch (settings.name) {
        case "/landing_page":
          return PageTransition(
            child: const LandingPage(),
            type: PageTransitionType.leftToRightWithFade,
          );
        case "/settings_page":
          return PageTransition(
            child: const SettingsPage(),
            type: PageTransitionType.rightToLeftWithFade,
          );
        default:
          return PageTransition(
            child: const SplashScreen(),
            type: PageTransitionType.rightToLeftWithFade,
          );
      }
    };
