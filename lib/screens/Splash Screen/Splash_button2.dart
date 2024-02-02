import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_app/utility/colors.dart';

// ignore: must_be_immutable
class SplashButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool loading;

  SplashButton2({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors().whiteColor, width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        width: double.infinity,
        height: 40,
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Center(
              child: Text(
                  text,
                  style: GoogleFonts.roboto(
                    color: AppColors().whiteColor,
                    fontSize: 16,
                  ),
                ),
            ),
      ),
    );
  }
}
