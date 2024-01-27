import 'package:e_commerce_app/auth/forget_password.dart';
import 'package:e_commerce_app/auth/signup.dart';
import 'package:e_commerce_app/screens/bottom_navBar.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/button.dart';
import 'package:e_commerce_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Deal Dash",
                    style: GoogleFonts.sansita(
                        color: AppColors().whiteColor, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start, // Start content
                  children: [
                    Center(
                      child: Text(
                        "Wellcome Back !",
                        style: GoogleFonts.montserrat(
                            color: AppColors().whiteColor, fontSize: 18),
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
                      "Login",
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
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const MyTextField(
                          hintText: 'Enter password',
                          labelText: 'Password',
                          icon: Icons.password),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 18.0,
                                height: 18.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(
                                    color: AppColors().whiteColor,
                                    width: 2.0,
                                  ),
                                ),
                                child: isChecked
                                    ? Icon(
                                        Icons.check,
                                        size: 12.0,
                                        color: AppColors().whiteColor,
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                "Remember",
                                style: GoogleFonts.roboto(
                                  color: AppColors().whiteColor,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ForgetPassword());
                          },
                          child: Text(
                            "Forget Password?",
                            style: GoogleFonts.roboto(
                              color: AppColors().whiteColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyButton(
                        text: 'Login',
                        onPressed: () {
                          Get.to(() => MyBottomNavbar());
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't have an account ? ",
                          style: GoogleFonts.roboto(
                              color: AppColors().whiteColor, fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const SignUpPage());
                          },
                          child: Text(
                            "Register",
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
    );
  }
}
