// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_app/utility/colors.dart';

class AddToCartButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool loading;

  AddToCartButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 216, 106, 2),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
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
                  color: AppColors().whiteColor,
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
