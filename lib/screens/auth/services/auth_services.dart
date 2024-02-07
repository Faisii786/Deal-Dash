import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/screens/Home%20Screen/bottom_navBar.dart';
import 'package:e_commerce_app/screens/auth/widgets/button.dart';
import 'package:e_commerce_app/screens/auth/widgets/otp_container.dart';
import 'package:e_commerce_app/utils/utills.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthServices {
  bool loading = false;
  // create user // signup
  Future CreateUser({
    // required parameters
    required String firstName,
    required String lastName,
    required String country,
    required String email,
    required String password,
    required String imagePath,
    required TextEditingController otp1Controller,
    required TextEditingController otp2Controller,
    required TextEditingController otp3Controller,
    required TextEditingController otp4Controller,
  }) async {
    // correct email pattern
    bool isValidEmail(String email) {
      final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
      return emailRegExp.hasMatch(email);
    }

    // validations
    if (firstName.isEmpty) {
      utills.snackbarTop("First name is empty");
    } else if (lastName.isEmpty) {
      utills.snackbarTop("Last name is empty");
    } else if (email.isEmpty) {
      utills.snackbarTop("Email is empty");
    } else if (country.isEmpty) {
      utills.snackbarTop("Country name is empty");
    } else if (!isValidEmail(email)) {
      utills.snackbarTop("Please Enter a valid email");
    } else if (password.isEmpty) {
      utills.snackbarTop("Password is Empty");
      return;
    } else if (password.length < 8) {
      utills.snackbarTop("Password must at least 8");
      return;
    } else {
      // send otp to verify the email
      EmailOTP _emailOTP = EmailOTP();
      _emailOTP.setConfig(
        appName: 'OTP Verification',
        appEmail: 'codewithtea@gmail.com',
        userEmail: email,
        otpLength: 4,
        otpType: OTPType.digitsOnly,
      );
      if (await _emailOTP.sendOTP() == true) {
        utills.snackbarTop("OTP has been sent");
        Get.bottomSheet(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.dialpad_rounded,
                      size: 50,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Please check your mail to get code. This help us mitigate fraud and keep your personal data.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Muli1'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Enter 4 Digits Pin",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Muli1'),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OtpContainers(
                          otpControllers: otp1Controller,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        OtpContainers(
                          otpControllers: otp2Controller,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        OtpContainers(
                          otpControllers: otp3Controller,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        OtpContainers(
                          otpControllers: otp4Controller,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyButton(
                        //loading: loading,
                        text: 'Confirm',
                        onPressed: () async {
                          // enter otp for email verification
                          try {
                            if (await _emailOTP.verifyOTP(
                                    otp: otp1Controller.text +
                                        otp2Controller.text +
                                        otp3Controller.text +
                                        otp4Controller.text) ==
                                true) {
                              utills.snackbarTop("Email is verified");
                              // if email is verified then create account
                              try {
                                // save image to firebase storage
                                Future<String> uploadImageToStorage() async {
                                  try {
                                    Reference storageReference =
                                        FirebaseStorage.instance.ref().child(
                                            'profile_images/${DateTime.now()}.jpg');

                                    await storageReference
                                        .putFile(File(imagePath));

                                    String imageURL =
                                        await storageReference.getDownloadURL();

                                    return imageURL;
                                  } catch (e) {
                                    print("Error uploading image: $e");
                                    throw e;
                                  }
                                }

                                String imageURL = await uploadImageToStorage();

                                // create user
                                UserCredential cred = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );

                                // store user data to firestore
                                await FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(cred.user!.uid.toString())
                                    .set({
                                  "uid": cred.user!.uid.toString(),
                                  "image": imageURL,
                                  "FirstName": firstName,
                                  "LastName": lastName,
                                  "country": country,
                                  "email": email,
                                  "password": password,
                                });
                                Get.to(() => MyBottomNavbar());
                              } catch (e) {
                                utills.snackbarTop(
                                    "Failed to create account: $e");
                              }
                            } else {
                              utills.snackbarTop("Invalid Otp");
                            }
                          } catch (e) {
                            utills.snackbarTop(e.toString());
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
        );
      } else {
        utills.snackbarTop("Opps, Otp send Failed");
      }
    }
  }

  // login user
  Future userLogin({
    required String email,
    required String password,
  }) async {
    // correct email pattern
    bool isValidEmail(String email) {
      final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
      return emailRegExp.hasMatch(email);
    }

    // validations
    if (email.isEmpty) {
      utills.snackbarTop("Email is empty");
    } else if (!isValidEmail(email)) {
      utills.snackbarTop("Please Enter a valid email");
    } else if (password.isEmpty) {
      utills.snackbarTop("Password is Empty");
      return;
    } else if (password.length < 8) {
      utills.snackbarTop("Password must at least 8");
      return;
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        Get.off(() => MyBottomNavbar());
      } on FirebaseAuthException catch (e) {
        utills.snackbarTop(e.toString());
      }
    }
  }

  // Password Reset
  Future ResetPassword({
    required String email,
  }) async {
    // correct email pattern
    bool isValidEmail(String email) {
      final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
      return emailRegExp.hasMatch(email);
    }

    // validations
    if (email.isEmpty) {
      utills.snackbarTop("Email is empty");
    } else if (!isValidEmail(email)) {
      utills.snackbarTop("Please Enter a valid email");
    } else {
      try {
        if (FirebaseAuth.instance.currentUser!.email != null) {
          await FirebaseAuth.instance
              .sendPasswordResetEmail(email: email.toString())
              .then((value) {
            utills
                .snackbarTop("We have Send to email ! Please Check Your email");
          });
        } else {
          utills.snackbarTop("No user found");
        }
      } on FirebaseAuthException catch (e) {
        utills.snackbarTop(e.toString());
      }
    }
  }
}
