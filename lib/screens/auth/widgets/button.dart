import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_app/res/colors.dart';

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
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors().backgroundColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 50,
        child: loading
            ? Center(
                child: CupertinoActivityIndicator(
                color: Colors.white,
              ))
            : Center(
                child: Text(
                  text,
                  style: GoogleFonts.lato(
                    color: AppColors().whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
    );
  }
}
