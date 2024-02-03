import 'package:e_commerce_app/screens/Splash%20Screen/Splash_button2.dart';
import 'package:e_commerce_app/screens/Splash%20Screen/splash_button1.dart';
import 'package:e_commerce_app/res/colors.dart';
import 'package:e_commerce_app/screens/Splash%20Screen/splash_services.dart';
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
  CheckUserState splashServices = CheckUserState();
  @override
  void initState() {
    super.initState();
     splashServices.islogin(context);
  }

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
              "assets/images/splash.jpg",
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
              SplashButton1(
                  text: "Get Start",
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  }),
              SizedBox(
                height: 10,
              ),
              SplashButton2(
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
