import 'package:e_commerce_app/Model/clothes_model.dart';
import 'package:e_commerce_app/utility/colors.dart';
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
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
          color: AppColors().backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          // child: Align(
          //   alignment: Alignment.topRight,
          //   child: GestureDetector(
          //     onTap: () {
          //       _toggleFavorite();
          //     },
          //     child: Icon(
          //       _fav ? Icons.favorite : Icons.favorite_outline,
          //       color: _fav ? Colors.red : Colors.white,
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
