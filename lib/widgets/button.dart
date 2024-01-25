import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_app/utility/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({super.key, 
    required this.text,
    required this.onPressed,
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
        child: Text(
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
