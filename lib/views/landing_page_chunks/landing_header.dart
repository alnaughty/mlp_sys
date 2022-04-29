import 'package:flutter/material.dart';

class LandingHeader extends StatefulWidget {
  const LandingHeader({Key? key, this.onPressedMenu}) : super(key: key);
  final Function()? onPressedMenu;
  @override
  State<LandingHeader> createState() => _LandingHeaderState();
}

class _LandingHeaderState extends State<LandingHeader> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) => SizedBox(
        width: constraint.maxWidth,
        height: 55,
        child: AppBar(
          leading: widget.onPressedMenu == null
              ? null
              : IconButton(
                  onPressed: widget.onPressedMenu,
                  icon: const Icon(Icons.menu),
                ),
          actions: [
            IconButton(
              tooltip: "Settings",
              onPressed: () {
                Navigator.pushNamed(context, '/settings_page');
              },
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
          backgroundColor: Colors.grey.shade100,
          title: const Text("TEST DESKTOP"),
          centerTitle: false,
        ),
      ),
    );
  }
}
