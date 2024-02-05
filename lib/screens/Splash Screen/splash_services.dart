import 'dart:async';
import 'package:e_commerce_app/screens/Home%20Screen/bottom_navBar.dart';
import 'package:e_commerce_app/screens/Splash%20Screen/wellcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckUserState {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Get.off(() => MyBottomNavbar());
      });
    } else if (user == null) {
      Timer(const Duration(seconds: 3), () {
        Get.off(() => const WellcomeScreen());
      });
    }
  }
}
