import 'dart:io';

import 'package:e_commerce_app/State%20Managment/image_picker.dart';
import 'package:e_commerce_app/responsive/screen_size.dart';
import 'package:e_commerce_app/screens/auth/login_screen.dart';
import 'package:e_commerce_app/screens/auth/services/auth_services.dart';
import 'package:e_commerce_app/screens/auth/theme/theme.dart';
import 'package:e_commerce_app/screens/auth/widgets/button.dart';
import 'package:e_commerce_app/screens/auth/widgets/custom_scaffold.dart';
import 'package:e_commerce_app/screens/auth/widgets/text_filed.dart';
import 'package:e_commerce_app/resouces/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  // otp controllers
  TextEditingController otp2controller = TextEditingController();
  TextEditingController otp1controller = TextEditingController();
  TextEditingController otp3controller = TextEditingController();
  TextEditingController otp4controller = TextEditingController();

  bool loading = false;

  imagePickerController _controller = Get.put(imagePickerController());
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 0,
            child: SizedBox(
              height: 9,
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: MediaQuery.of(context).size.width > mobileScreenWidth
                      ? EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.28)
                      : EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Let's Sign up",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: lightColorScheme.primary,
                            fontFamily: 'Muli1'),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Obx(() {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller.imagePick();
                              },
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundImage: _controller
                                            .imgPath.isNotEmpty
                                        ? FileImage(File(
                                            _controller.imgPath.toString()))
                                        : AssetImage(
                                                "assets/images/dprofile.png")
                                            as ImageProvider,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15, right: 5),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: AppColors().greykColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                      const SizedBox(
                        height: 10.0,
                      ),
                      MyTextField(
                        controller: firstnamecontroller,
                        name: 'First name',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      MyTextField(
                        controller: lastnamecontroller,
                        name: 'Last name',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      MyTextField(
                        controller: countrycontroller,
                        name: 'Country',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      MyTextField(
                        controller: emailcontroller,
                        name: 'Email',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                        controller: passwordcontroller,
                        name: 'Password',
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      MyButton(
                          loading: loading,
                          text: 'Register',
                          onPressed: () {
                            AuthServices().CreateUser(
                              firstName: firstnamecontroller.text.toString(),
                              lastName: lastnamecontroller.text.toString(),
                              country: countrycontroller.text.toString(),
                              email: emailcontroller.text.toString(),
                              password: passwordcontroller.text.toString(),
                              imagePath: _controller.imgPath.toString(),
                              otp1Controller: otp1controller,
                              otp2Controller: otp2controller,
                              otp3Controller: otp3controller,
                              otp4Controller: otp4controller,
                            );
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
                              'Sign up',
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
                              Get.to(() => const LoginScreen(),
                                  transition: Transition.downToUp,
                                  duration: Duration(seconds: 2));
                            },
                            child: Text(
                              "Login",
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
          ),
        ],
      ),
    );
  }
}
