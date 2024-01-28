import 'package:e_commerce_app/components/foryouCollection/products_detail_screen.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProducts extends StatelessWidget {
  final String img;
  const PopularProducts({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductsDetailScreen());
      },
      child: Container(
        height: 180,
        width: Get.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors().SearchTextFieldbkgrnClr,
        ),
        child: Center(
          child: Image.asset(img),
        ),
      ),
    );
  }
}
