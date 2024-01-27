import 'package:e_commerce_app/Model/clothes_model.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnCustomMaterial extends StatelessWidget {
  final ClothesModel clothes;
  const ReturnCustomMaterial({super.key, required this.clothes});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Container(
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  image: DecorationImage(
                      image: AssetImage(clothes.img), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors().backgroundColor),
            ),
          ),
          Text(
            "Brand Name",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
