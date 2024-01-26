import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialforYou extends StatelessWidget {
  const SpecialforYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: Get.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors().SearchTextFieldbkgrnClr,
      ),
      child: Center(
        child: Text(
          'Image?',
          style: GoogleFonts.dmSans(
            color: AppColors().blackColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
