import 'package:firebase_auth_dart/firebase_auth_dart.dart';
import 'package:flutter/material.dart';
import 'package:mlp_sys/services/data_cacher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final DataCacher _cacher = DataCacher.instance;
  check() async {
    final User? savedUser = await _cacher.currentUser;
    if (savedUser != null) {
      Navigator.pushReplacementNamed(context, "/landing_page");
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushNamed(context, '/login_page');
    }
  }

  @override
  void initState() {
    check();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
