import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';

class introPage3 extends StatelessWidget {
  const introPage3({super.key});

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
          child: Image.asset(
            "assets/images/splash_3.png",
            width: 200,
          ),
        ),
      ),
    );
  }
}
