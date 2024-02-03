import 'package:e_commerce_app/responsive/screen_size.dart';
import 'package:flutter/material.dart';

class ResponsiveScreens extends StatefulWidget {
  final WebScreen;
  final MobileScreen;
  const ResponsiveScreens(
      {super.key, required this.WebScreen, required this.MobileScreen});

  @override
  State<ResponsiveScreens> createState() => _ResponsiveScreensState();
}

class _ResponsiveScreensState extends State<ResponsiveScreens> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext, constraints) {
      if (constraints.maxWidth > mobileScreenWidth) {
        return widget.WebScreen;
      }
      return widget.MobileScreen;
    });
  }
}
