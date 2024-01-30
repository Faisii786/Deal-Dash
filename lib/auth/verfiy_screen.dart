import 'package:e_commerce_app/screens/bottom_navBar.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/button.dart';
import 'package:e_commerce_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyPhoneNumber extends StatefulWidget {
  final verificationIddd;
  const VerifyPhoneNumber({super.key, required this.verificationIddd});

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  TextEditingController phonecontroller = TextEditingController();
  final SnakBarKey = GlobalKey<ScaffoldMessengerState>();
  bool loading = false;

  // snackbar function
  void showSnakBar(String message) {
    final snakbar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 4),
    );
    SnakBarKey.currentState?.showSnackBar(snakbar);
  }

  void LoginWithNumbe() {
    if (phonecontroller.text.isEmpty) {
      showSnakBar("Phone is Empty");
    } else {
      phoneNumber();
    }
  }

  Future phoneNumber() async {
    setState(() {
      loading = true;
    });
    final Credentials = PhoneAuthProvider.credential(
        verificationId: widget.verificationIddd,
        smsCode: phonecontroller.text.toString());

    try {
      await FirebaseAuth.instance.signInWithCredential(Credentials);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyBottomNavbar()));
    } on FirebaseAuthException catch (e) {
      setState(() {
        loading = false;
      });
      showSnakBar("$e");
    }
    setState(() {
      loading = false;
    });
  }

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
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Deal Dash",
                          style: GoogleFonts.sansita(
                              color: AppColors().whiteColor, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Verification",
                        style: GoogleFonts.alatsi(
                            color: Colors.white.withOpacity(0.8), fontSize: 25),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: MyTextField(
                            controller: phonecontroller,
                            hintText: 'please enter code',
                            labelText: 'Enter 6 digit code',
                            icon: Icons.code),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MyButton(
                          loading: loading,
                          text: 'Verify Code',
                          onPressed: () {
                            LoginWithNumbe();
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
