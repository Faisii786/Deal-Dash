import 'package:e_commerce_app/responsive/screen_size.dart';
import 'package:e_commerce_app/screens/auth/theme/theme.dart';
import 'package:e_commerce_app/screens/auth/widgets/button.dart';
import 'package:e_commerce_app/screens/auth/widgets/custom_scaffold.dart';
import 'package:e_commerce_app/screens/auth/widgets/text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassoword extends StatefulWidget {
  const ForgetPassoword({super.key});

  @override
  State<ForgetPassoword> createState() => _ForgetPassowordState();
}

class _ForgetPassowordState extends State<ForgetPassoword> {
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

      if (FirebaseAuth.instance.currentUser!.email != null) {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailcontroller.text.toString())
            .then((value) {
          showSnakBar("We have Send to email ! Please Check Your email");
          emailcontroller.clear();
          setState(() {
            loading = false;
          });
        });
      } else {
        showSnakBar("No user found");
      }
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
    return ScaffoldMessenger(
      key: SnakBarKey,
      child: CustomScaffold(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: SizedBox(
                height: 8,
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
                          "Reset your Password !",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                              fontFamily: 'Muli1'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please enter your email, and we'll send you an email to reset your password",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.0, fontFamily: 'Muli1'),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        MyTextField(
                          controller: emailcontroller,
                          name: 'Email',
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        MyButton(
                            text: 'Reset Password',
                            onPressed: () {
                              ForgetFunction();
                            }),
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
