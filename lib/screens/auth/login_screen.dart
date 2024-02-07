import 'package:e_commerce_app/responsive/screen_size.dart';
import 'package:e_commerce_app/screens/auth/services/auth_services.dart';
import 'package:e_commerce_app/screens/auth/signup_screen.dart';
import 'package:e_commerce_app/screens/auth/theme/theme.dart';
import 'package:e_commerce_app/screens/auth/widgets/button.dart';
import 'package:e_commerce_app/screens/auth/widgets/custom_scaffold.dart';
import 'package:e_commerce_app/screens/auth/widgets/text_filed.dart';
import 'package:e_commerce_app/resouces/colors.dart';
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

  TextEditingController resetemailController = TextEditingController();

  bool isChecked = false;

  bool loading = false;

  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                child: Padding(
                  padding:
                      MediaQuery.of(context).size.width > mobileScreenWidth
                          ? EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.28)
                          : EdgeInsets.all(0),
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
                                      borderRadius:
                                          BorderRadius.circular(4.0),
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
                                Get.bottomSheet(
                                    Container(
                                      padding:
                                          MediaQuery.of(context).size.width >
                                                  mobileScreenWidth
                                              ? EdgeInsets.symmetric(
                                                  horizontal: 80,
                                                  vertical: 16)
                                              : EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Reset your Password !",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w900,
                                                color:
                                                    lightColorScheme.primary,
                                                fontFamily: 'Muli1'),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Please enter your email, and we'll send you an email to reset your password",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'Muli1'),
                                          ),
                                          SizedBox(height: 10),
                                          MyTextField(
                                              controller:
                                                  resetemailController,
                                              name: "Enter your email"),
                                          SizedBox(height: 30),
                                          MyButton(
                                              loading: loading,
                                              text: 'Reset Password',
                                              onPressed: () {
                                                AuthServices().ResetPassword(
                                                    email:
                                                        resetemailController
                                                            .text
                                                            .toString());
                                              }),
                                        ],
                                        // Changed your mind? Go back to the login screen.
                                      ),
                                    ),
                                    backgroundColor: Colors.white);
    
                                // Get.to(() => const ForgetPassoword(),
                                //     transition: Transition.fadeIn,
                                //     duration: Duration(seconds: 2));
                              },
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 179, 19, 7),
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
                          loading: loading,
                          text: 'Sign in',
                          onPressed: () {
                            AuthServices().userLogin(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString());
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
                                  color:
                                      const Color.fromARGB(255, 73, 7, 255),
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
          ),
        ],
      ),
    );
  }
}
