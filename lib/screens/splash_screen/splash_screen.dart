import 'dart:async';

import 'package:e_commerce_app/screens/introScreens/intro_page1.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.to(() => introPage1());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors().backgroundColor,
            AppColors().backgroundColor1,
          ]),
        ),
        child: Center(
          child: Text(
            "Splash Screen",
            style: TextStyle(color: AppColors().whiteColor, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
