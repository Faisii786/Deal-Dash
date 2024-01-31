// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool loading;

  BuyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.orange,
            const Color.fromARGB(255, 248, 192, 24),
            Colors.orange,
          ]),
          //color: AppColors().backgroundColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        child: TextButton(
          onPressed: onPressed,
          child: loading
              ? CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: GoogleFonts.lato(
                    color: AppColors().blackColor,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}
