import 'package:e_commerce_app/screens/Splash%20Screen/widgets/welcome_button2.dart';
import 'package:e_commerce_app/screens/Splash%20Screen/widgets/welcome_button1.dart';
import 'package:e_commerce_app/resouces/colors.dart';
import 'package:e_commerce_app/screens/auth/login_screen.dart';
import 'package:e_commerce_app/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(
                  0.6), // Adjust the opacity value to change brightness
              BlendMode.multiply,
            ),
            child: Image.asset(
              "assets/images/wellcome.jpg",
              fit: BoxFit.cover,
              height: Get.height,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Brand New",
                style: TextStyle(
                    color: AppColors().whiteColor,
                    fontSize: 30,
                    fontFamily: 'Muli1'),
              ),
              Text(
                "Perspective",
                style: TextStyle(
                    color: AppColors().whiteColor,
                    fontSize: 30,
                    fontFamily: 'Muli1'),
              ),
              Text(
                "Lets start our collection.",
                style: TextStyle(
                    color: AppColors().whiteColor,
                    fontSize: 20,
                    fontFamily: 'Muli6'),
              ),
              SizedBox(
                height: 100,
              ),
              WelcomeButton1(
                  text: "Get Started",
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  }),
              SizedBox(
                height: 10,
              ),
              WelcomeButton2(
                  text: "Create Account",
                  onPressed: () {
                    Get.to(() => SignupScreen());
                  }),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
