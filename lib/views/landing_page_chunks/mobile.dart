import 'package:flutter/material.dart';
import 'package:mlp_sys/globals/app.dart';
import 'package:mlp_sys/globals/variables.dart';
import 'package:mlp_sys/models/nav_item_model.dart';
import 'package:mlp_sys/views/landing_page_chunks/landing_content.dart';
import 'package:mlp_sys/views/landing_page_chunks/landing_header.dart';

class LandingMobileView extends StatefulWidget {
  const LandingMobileView({Key? key, required this.controller})
      : super(key: key);
  final TabController controller;
  @override
  State<LandingMobileView> createState() => _LandingMobileViewState();
}

class _LandingMobileViewState extends State<LandingMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Drawer(
      //   backgroundColor: Colors.white,
      // ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LandingHeader(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        currentIndex: landingIndex,
        unselectedItemColor: Colors.grey.shade600,
        onTap: (index) {
          setState(() {
            landingIndex = index;
          });
          widget.controller.animateTo(landingIndex);
        },
        items: [
          ...navItems.map(
            (e) => BottomNavigationBarItem(
              icon: e.icon,
              label: e.label,
            ),
          ),
        ],
      ),
      body: LandingContent(
        controller: widget.controller,
      ),
    );
  }
}
