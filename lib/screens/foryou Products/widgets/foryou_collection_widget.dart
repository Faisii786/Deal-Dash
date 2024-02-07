import 'package:e_commerce_app/Model/products_model.dart';
import 'package:e_commerce_app/resouces/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnCustomMaterial extends StatefulWidget {
  final ClothesModel clothes;

  ReturnCustomMaterial({super.key, required this.clothes});

  @override
  State<ReturnCustomMaterial> createState() => _ReturnCustomMaterialState();
}

class _ReturnCustomMaterialState extends State<ReturnCustomMaterial> {
  // bool _fav = false;

  // void _toggleFavorite() {
  //   setState(() {
  //     _fav = !_fav;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.clothes.ontap(); // Call the ontap function from the ClothesModel
      },
      child: Container(
        height: Get.height * 0.2,
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          image: DecorationImage(
            image: AssetImage(widget.clothes.img),
          ),
          borderRadius: BorderRadius.circular(10),
          color: AppColors().backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
        ),
      ),
    );
  }
}
