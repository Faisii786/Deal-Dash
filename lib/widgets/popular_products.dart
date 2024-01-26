import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: Get.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
