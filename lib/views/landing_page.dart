import 'package:flutter/material.dart';
import 'package:mlp_sys/globals/app.dart';
import 'package:mlp_sys/views/landing_page_chunks/desktop.dart';
import 'package:mlp_sys/views/landing_page_chunks/mobile.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  @override
  void initState() {
    _controller = TabController(
      vsync: this,
      length: navItems.length,
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: LayoutBuilder(
        builder: (_, constraint) {
          if (constraint.maxWidth < 600) {
            return LandingMobileView(
              controller: _controller,
            );
          }
          return LandingDesktopView(
            controller: _controller,
          );
        },
      ),
    );
  }
}
