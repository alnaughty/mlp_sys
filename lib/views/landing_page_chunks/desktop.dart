import 'package:flutter/material.dart';
import 'package:mlp_sys/globals/app.dart';
import 'package:mlp_sys/globals/variables.dart';
import 'package:mlp_sys/views/landing_page_chunks/landing_content.dart';
import 'package:mlp_sys/views/landing_page_chunks/landing_header.dart';

class LandingDesktopView extends StatefulWidget {
  const LandingDesktopView({Key? key, required this.controller})
      : super(key: key);
  final TabController controller;
  @override
  State<LandingDesktopView> createState() => _LandingDesktopViewState();
}

class _LandingDesktopViewState extends State<LandingDesktopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraint) => Column(
          children: [
            LandingHeader(
              onPressedMenu: () {
                setState(() {
                  isEnabled = !isEnabled;
                });
              },
            ),
            Expanded(
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: isEnabled ? 230 : 55,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(2, 0),
                          color: Colors.black26.withOpacity(.2),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(0),
                      children: [
                        ...navItems.map(
                          (e) => Tooltip(
                            message: e.label,
                            child: MaterialButton(
                              height: 60,
                              color: navItems.indexOf(e) == landingIndex
                                  ? Colors.blue
                                  : null,
                              onPressed: () {
                                setState(() {
                                  landingIndex = navItems.indexOf(e);
                                });
                                widget.controller.animateTo(landingIndex);
                                // widget.controller.animateToPage(
                                //   landingIndex,
                                //   curve: Curves.fastLinearToSlowEaseIn,
                                //   duration: const Duration(
                                //     milliseconds: 500,
                                //   ),
                                // );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    e.icon.icon,
                                    color: navItems.indexOf(e) == landingIndex
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  if (isEnabled) ...{
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  },
                                  ClipRRect(
                                    child: Text(
                                      isEnabled ? e.label : "",
                                      style: TextStyle(
                                        color:
                                            navItems.indexOf(e) == landingIndex
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: LandingContent(
                      controller: widget.controller,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
