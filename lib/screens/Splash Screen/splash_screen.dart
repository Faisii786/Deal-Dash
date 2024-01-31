import 'package:e_commerce_app/screens/Splash%20Screen/splash_services.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';

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
