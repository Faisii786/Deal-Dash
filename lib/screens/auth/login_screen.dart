import 'package:e_commerce_app/screens/Home%20Screen/bottom_navBar.dart';
import 'package:e_commerce_app/screens/auth/forget_passsword_screen.dart';
import 'package:e_commerce_app/screens/auth/signup_screen.dart';
import 'package:e_commerce_app/screens/auth/theme/theme.dart';
import 'package:e_commerce_app/screens/auth/widgets/button.dart';
import 'package:e_commerce_app/screens/auth/widgets/custom_scaffold.dart';
import 'package:e_commerce_app/screens/auth/widgets/text_filed.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isChecked = false;

  GlobalKey<FormState> MyKey = GlobalKey();
  bool loading = false;

  void ValidateFunction() {
    if (emailController.text.isEmpty) {
      showSnakBar("Email is Empty");
      return;
    } else if (!isValidEmail(emailController.text)) {
      showSnakBar("Please Enter a valid email");
    } else if (emailController.text.isEmpty) {
      showSnakBar("Password is Empty");
      return;
    } else if (passwordController.text.length < 8) {
      showSnakBar("Password must at least 8");
      return;
    } else {
      Login();
    }
  }

  Future Login() async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.off(() => MyBottomNavbar());

      emailController.clear();
      passwordController.clear();
      setState(() {
        loading = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        showSnakBar(
            "Invalid Credentials ! Please enter valid email and password");
      } else if (e.code == 'user-not-found') {
        showSnakBar("Email does not foud");
      } else if (e.code == 'wrong-password') {
        showSnakBar("Password is incorrect");
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
    return ScaffoldMessenger(
      key: SnakBarKey,
      child: CustomScaffold(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                height: 9,
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Wellcome Back !",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: lightColorScheme.primary,
                            fontFamily: 'Muli1'),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MyTextField(
                        controller: emailController,
                        name: 'Email',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      MyTextField(
                        controller: passwordController,
                        name: 'Password',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
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
                                        color: AppColors().blackColor,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: isChecked
                                        ? Icon(
                                            Icons.check,
                                            size: 12.0,
                                            color: AppColors().blackColor,
                                          )
                                        : null,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    "Remember",
                                    style: TextStyle(
                                      color: AppColors().blackColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const ForgetPassoword(),
                                    transition: Transition.fadeIn,
                                    duration: Duration(seconds: 2));
                              },
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 179, 19, 7),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      MyButton(
                          text: 'Sign in',
                          onPressed: () {
                            ValidateFunction();
                          }),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Color.fromARGB(255, 105, 105, 105)
                                  .withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Color.fromARGB(255, 49, 49, 49),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Color.fromARGB(255, 105, 105, 105)
                                  .withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.facebook,
                          ),
                          Icon(
                            Icons.facebook,
                          ),
                          Icon(
                            Icons.facebook,
                          ),
                          Icon(
                            Icons.facebook,
                          ),
                          // Logo(Logos.facebook_f),
                          // Logo(Logos.twitter),
                          // Logo(Logos.google),
                          // Logo(Logos.apple),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't have an account ? ",
                            style: GoogleFonts.roboto(
                                color: AppColors().blackColor, fontSize: 15),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignupScreen(),
                                  transition: Transition.upToDown,
                                  duration: Duration(seconds: 2));
                            },
                            child: Text(
                              "Register",
                              style: GoogleFonts.montserrat(
                                  color: const Color.fromARGB(255, 73, 7, 255),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
