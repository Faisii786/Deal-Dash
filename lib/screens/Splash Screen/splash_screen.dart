import 'package:e_commerce_app/screens/Splash%20Screen/splash_services.dart';
import 'package:e_commerce_app/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(
                flex: 3,
              ),
              Text(
                "Wellcome",
                style: TextStyle(
                    color: AppColors().whiteColor,
                    fontSize: 28,
                    fontFamily: 'Muli1'),
              ),
              Text(
                "To my ecommerce \nApp .....",
                style: TextStyle(
                    color: AppColors().whiteColor,
                    fontSize: 20,
                    fontFamily: 'Muli6'),
              ),
              Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
