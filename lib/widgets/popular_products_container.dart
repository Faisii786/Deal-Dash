import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProducts extends StatelessWidget {
  final String img;
  final VoidCallback onTap;
  const PopularProducts({super.key, required this.img, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: Get.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors().SearchTextFieldbkgrnClr,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(img),
          ),
        ),
      ),
    );
  }
}
