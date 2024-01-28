import 'package:e_commerce_app/auth/login_page.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/button.dart';
import 'package:e_commerce_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  GlobalKey<FormState> MyKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool loading = false;

  void ValidateFunction() {
    if (firstnamecontroller.text.isEmpty) {
      showSnakBar("First name is empty");
    } else if (lastnamecontroller.text.isEmpty) {
      showSnakBar("Last name is empty");
    } else if (emailcontroller.text.isEmpty) {
      showSnakBar("Email is Empty");
      return;
    } else if (!isValidEmail(emailcontroller.text)) {
      showSnakBar("Please Enter a valid email");
    } else if (passwordcontroller.text.isEmpty) {
      showSnakBar("Password is Empty");
      return;
    } else if (passwordcontroller.text.length < 8) {
      showSnakBar("Password must at least 8");
      return;
    } else {
      Register();
    }
  }

  Future Register() async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      showSnakBar("Account Created Successfully");
      firstnamecontroller.clear();
      lastnamecontroller.clear();
      emailcontroller.clear();
      passwordcontroller.clear();
      setState(() {
        loading = false;
      });
    } catch (e) {
      print("Error creating account: $e");
      showSnakBar("Failed to create account: $e");
      print('$e');
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
                          child: MyTextField(
                              controller: firstnamecontroller,
                              hintText: 'Enter Firts Name',
                              labelText: 'Firts Name',
                              icon: Icons.person),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: MyTextField(
                              controller: lastnamecontroller,
                              hintText: 'Enter Last Name',
                              labelText: 'Last Name',
                              icon: Icons.person),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: MyTextField(
                              controller: emailcontroller,
                              hintText: 'Enter Email',
                              labelText: 'Email Adress',
                              icon: Icons.person),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: MyTextField(
                              controller: passwordcontroller,
                              hintText: 'Enter password',
                              labelText: 'Password',
                              icon: Icons.password),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MyButton(
                            loading: loading,
                            text: 'Register',
                            onPressed: () {
                              ValidateFunction();
                            }),
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
      ),
    );
  }
}
