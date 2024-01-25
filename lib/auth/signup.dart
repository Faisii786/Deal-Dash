import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/button.dart';
import 'package:e_commerce_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
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
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, bottom: 50, top: 20),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Deal Dash",
                      style: TextStyle(color: AppColors().whiteColor),
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
                                  "Remember Password",
                                  style: GoogleFonts.roboto(
                                    color: AppColors().whiteColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
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
                        height: 50,
                      ),
                      MyButton(text: 'Login', onPressed: () {}),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not a member yet ? ",
                            style: GoogleFonts.roboto(
                                color: AppColors().whiteColor, fontSize: 18),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Register",
                              style: GoogleFonts.montserrat(
                                  color: Colors.amber,
                                  fontSize: 18,
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
