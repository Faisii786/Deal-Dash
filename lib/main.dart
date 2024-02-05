import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/responsive/resp.dart';
import 'package:e_commerce_app/screens/Home%20Screen/web_Screen.dart';
import 'package:e_commerce_app/screens/Splash%20Screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //stripe payment
  Stripe.publishableKey =
      'pk_test_51OesWGKrSc6pdQwiJvQrVhMjuIFg2KOOP0sMvTH8huUNNW5oPrNjXMzQebbV2d0fZU7snqpzqaRxYxIsSltJGmRC00oDJN7Gaw';

  await Stripe.instance.applySettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Deal Dash',
        theme: ThemeData.light(),
        home: ResponsiveScreens(
            WebScreen: MyWebScreen(), MobileScreen: SplashScreen()));
  }
}
