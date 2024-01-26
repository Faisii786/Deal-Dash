import 'package:e_commerce_app/auth/login_page.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/button.dart';
import 'package:e_commerce_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Deal Dash",
                      style: GoogleFonts.sansita(
                          color: AppColors().whiteColor, fontSize: 18),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Start content
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 30,
                        height: 2,
                        child: LinearProgressIndicator(
                          value: 3,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.amber),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Signup",
                        style: GoogleFonts.montserrat(
                            color: AppColors().whiteColor, fontSize: 30),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const MyTextField(
                            hintText: 'Enter Firts Name',
                            labelText: 'Firts Name',
                            icon: Icons.person),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const MyTextField(
                            hintText: 'Enter Last Name',
                            labelText: 'Last Name',
                            icon: Icons.person),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const MyTextField(
                            hintText: 'Enter Email',
                            labelText: 'Email Adress',
                            icon: Icons.person),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const MyTextField(
                            hintText: 'Enter password',
                            labelText: 'Password',
                            icon: Icons.password),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const MyTextField(
                            hintText: 'Enter Confirm password',
                            labelText: 'Confirm Password',
                            icon: Icons.password),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyButton(text: 'Register', onPressed: () {}),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Registered ? ",
                            style: GoogleFonts.roboto(
                                color: AppColors().whiteColor, fontSize: 15),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const LoginPage());
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.montserrat(
                                  color: Colors.amber,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
