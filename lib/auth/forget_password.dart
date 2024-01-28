import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/button.dart';
import 'package:e_commerce_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  GlobalKey<FormState> MyKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  bool loading = false;

  void ForgetFunction() {
    if (emailcontroller.text.isEmpty) {
      showSnakBar("Email is Empty");
      return;
    } else if (!isValidEmail(emailcontroller.text)) {
      showSnakBar("Please Enter a valid email");
    } else {
      Reset_Password();
    }
  }

  Future Reset_Password() async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.toString())
          .then((value) {
        showSnakBar("We have Send to email ! Please Check Your email");
        emailcontroller.clear();
        setState(() {
          loading = false;
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        showSnakBar("Invalid Credentials ! Please enter valid email");
      } else if (e.code == 'user-not-found') {
        showSnakBar("Email does not foud");
      }
      setState(() {
        loading = false;
      });
    }
  }

  // Function to validate email using a regular expression
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }

  // snackbar function
  void showSnakBar(String message) {
    final snakbar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 4),
    );
    SnakBarKey.currentState?.showSnackBar(snakbar);
  }

  final SnakBarKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldMessenger(
        key: SnakBarKey,
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
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 50, top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Start content
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
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.amber),
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
                          child: MyTextField(
                              controller: emailcontroller,
                              hintText: 'Enter Email',
                              labelText: 'Email Adress',
                              icon: Icons.person),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MyButton(
                            loading: loading,
                            text: 'Forget',
                            onPressed: () {
                              ForgetFunction();
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
