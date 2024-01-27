import 'package:e_commerce_app/screens/bottom_navBar.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/button.dart';
import 'package:e_commerce_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors().backgroundColor,
              AppColors().backgroundColor1,
            ]),
          ),
          height: Get.height * 1,
          width: Get.width * 1,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start, // Start content
                  children: [
                    Center(
                      child: Text(
                        "Reset your Passowrd !",
                        style: GoogleFonts.montserrat(
                            color: AppColors().whiteColor, fontSize: 18),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Please enter email to reset your Passowrd !",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            color: AppColors().whiteColor, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      width: 30,
                      height: 2,
                      child: LinearProgressIndicator(
                        value: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Forget",
                      style: GoogleFonts.montserrat(
                          color: AppColors().whiteColor, fontSize: 30),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const MyTextField(
                          hintText: 'Enter Email',
                          labelText: 'Email Adress',
                          icon: Icons.person),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyButton(
                        text: 'Forget',
                        onPressed: () {
                          Get.to(() => MyBottomNavbar());
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
