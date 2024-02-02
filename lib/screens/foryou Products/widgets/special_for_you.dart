import 'package:e_commerce_app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialforYou extends StatelessWidget {
  final VoidCallback ontap;
  final String img;
  const SpecialforYou({super.key, required this.ontap, required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 130,
        width: Get.width * 0.7,
        decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: AppColors().SearchTextFieldbkgrnClr),
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          color: AppColors().SearchTextFieldbkgrnClr,
        ),
      ),
    );
  }
}
