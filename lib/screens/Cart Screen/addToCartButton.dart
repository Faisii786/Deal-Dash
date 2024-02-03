// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/res/colors.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;
  bool loading;

  AddToCartButton({
    super.key,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Color.fromARGB(255, 3, 6, 167),
        color: AppColors().backgroundColor2,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width * 0.16,
      height: 50,
      child: TextButton(
          onPressed: onPressed,
          child: loading
              ? CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors().whiteColor,
                  size: 30,
                )),
    );
  }
}
