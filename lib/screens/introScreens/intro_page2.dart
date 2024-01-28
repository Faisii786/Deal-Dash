import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';

class introPage2 extends StatelessWidget {
  const introPage2({super.key});

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
            "assets/images/splash_2.png",
            width: 200,
          ),
        ),
      ),
    );
  }
}
