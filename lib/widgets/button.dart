import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_app/utility/colors.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool loading;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors().whiteColor,
        borderRadius: BorderRadius.circular(50),
      ),
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        child: loading
            ? CircularProgressIndicator()
            : Text(
                text,
                style: GoogleFonts.lato(
                  color: AppColors().blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
