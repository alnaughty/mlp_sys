import 'package:flutter/material.dart';
import 'package:mlp_sys/globals/variables.dart';

class LandingContent extends StatefulWidget {
  const LandingContent({Key? key, required this.controller}) : super(key: key);
  final TabController controller;
  @override
  State<LandingContent> createState() => _LandingContentState();
}

class _LandingContentState extends State<LandingContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: LayoutBuilder(
        builder: (_, constraint) {
          // print(widget.controller.page!.toInt());
          // widget.controller.
          // if (widget.controller.page!.toInt() != landingIndex) {
          //   widget.controller.animateToPage(
          //     landingIndex,
          //     curve: Curves.fastLinearToSlowEaseIn,
          //     duration: const Duration(
          //       milliseconds: 500,
          //     ),
          //   );
          // }
          return TabBarView(
            controller: widget.controller,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blueGrey,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          );
        },
      ),
    );
  }
}
