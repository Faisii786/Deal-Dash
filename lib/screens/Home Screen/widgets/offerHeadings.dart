import 'package:e_commerce_app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OffersHeadings extends StatelessWidget {
  final String heading;
  const OffersHeadings({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: GoogleFonts.dmSans(
              color: AppColors().blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
