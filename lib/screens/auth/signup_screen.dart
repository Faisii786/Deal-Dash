import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/State%20Managment/image_picker.dart';
import 'package:e_commerce_app/responsive/screen_size.dart';
import 'package:e_commerce_app/screens/Home%20Screen/bottom_navBar.dart';
import 'package:e_commerce_app/screens/auth/login_screen.dart';
import 'package:e_commerce_app/screens/auth/theme/theme.dart';
import 'package:e_commerce_app/screens/auth/widgets/button.dart';
import 'package:e_commerce_app/screens/auth/widgets/custom_scaffold.dart';
import 'package:e_commerce_app/screens/auth/widgets/text_filed.dart';
import 'package:e_commerce_app/res/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // for phone
  // TextEditingController phonecontroller = TextEditingController();
  // bool isHovered = false;
  // String countryvalue = '';

  bool isChecked = false;
  GlobalKey<FormState> MyKey = GlobalKey();

  // for mail
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool loading = false;

  void SignupFunction() {
    if (firstnamecontroller.text.isEmpty) {
      showSnakBar("First name is empty");
    } else if (lastnamecontroller.text.isEmpty) {
      showSnakBar("Last name is empty");
    } else if (emailcontroller.text.isEmpty) {
    } else if (phonecontroller.text.isEmpty) {
      showSnakBar("Phone number is empty");
    } else if (emailcontroller.text.isEmpty) {
    } else if (countrycontroller.text.isEmpty) {
      showSnakBar("Country name is empty");
    } else if (emailcontroller.text.isEmpty) {
      showSnakBar("Email is Empty");
      return;
    } else if (!isValidEmail(emailcontroller.text)) {
      showSnakBar("Please Enter a valid email");
    } else if (passwordcontroller.text.isEmpty) {
      showSnakBar("Password is Empty");
      return;
    } else if (passwordcontroller.text.length < 8) {
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

      //upload image
      String imageURL = await uploadImageToStorage();

      // create user
      UserCredential cred =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );

      // phone authentication
      // String fullphonenumber = '+' + countryvalue + phonecontroller.text;
      // FirebaseAuth.instance.verifyPhoneNumber(
      //     phoneNumber: fullphonenumber,
      //     verificationCompleted: (PhoneAuthCredential credential) async {
      //       await FirebaseAuth.instance.signInWithCredential(credential);
      //     },
      //     verificationFailed: (FirebaseAuthException e) {
      //       showSnakBar("$e");
      //       setState(() {
      //         loading = false;
      //       });
      //     },
      //     codeSent: (String verificationId, int? token) {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) =>
      //                   VerifyPhoneNumber(verificationIddd: verificationId)));
      //     },
      //     codeAutoRetrievalTimeout: (e) {
      //       showSnakBar("$e");
      //       setState(() {
      //         loading = false;
      //       });
      //     });

      await FirebaseFirestore.instance
          .collection("users")
          .doc(cred.user!.uid.toString())
          .set({
        "uid": cred.user!.uid.toString(),
        "image": imageURL,
        "FirstName": firstnamecontroller.text,
        "LastName": lastnamecontroller.text,
        "phone": phonecontroller.text,
        "country": countrycontroller.text,
        "email": emailcontroller.text,
        "password": passwordcontroller.text,
      });
      Get.to(() => MyBottomNavbar(),
          transition: Transition.size, duration: Duration(seconds: 3));
      setState(() {
        loading = false;
      });
      firstnamecontroller.clear();
      lastnamecontroller.clear();
      phonecontroller.clear();
      countrycontroller.clear();
      emailcontroller.clear();
      passwordcontroller.clear();
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

  //upload image to firebase storage
  Future<String> uploadImageToStorage() async {
    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_images/${DateTime.now()}.jpg');

      // Upload the image
      await storageReference.putFile(File(_controller.imgPath.toString()));

      // Get the download URL for the uploaded image
      String imageURL = await storageReference.getDownloadURL();

      return imageURL;
    } catch (e) {
      print("Error uploading image: $e");
      throw e; // Throw the error to handle it in the Register function
    }
  }

  imagePickerController _controller = Get.put(imagePickerController());

  final SnakBarKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: SnakBarKey,
      child: CustomScaffold(
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
                          controller: phonecontroller,
                          name: 'Phone',
                        ),
                        const SizedBox(
                          height: 15,
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
                            text: 'Register',
                            onPressed: () {
                              SignupFunction();
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
                                Get.to(() => const LoginScreen(),
                                    transition: Transition.downToUp,
                                    duration: Duration(seconds: 2));
                              },
                              child: Text(
                                "Login",
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
      ),
    );
  }
}
