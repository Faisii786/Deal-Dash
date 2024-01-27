import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CashBackContainer extends StatelessWidget {
  const CashBackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors().backgroundColor1,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "A Winter Surprise",
              style: GoogleFonts.roboto(
                  color: AppColors().whiteColor, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Cashback 20%",
              style: GoogleFonts.sansita(
                  color: AppColors().whiteColor, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
