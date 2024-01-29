import 'package:e_commerce_app/State%20Managment/state_managment.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CartAndNoticationIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  CartAndNoticationIcon({required this.icon, required this.onTap});

  stateController controller = Get.put(stateController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: AppColors().SearchTextFieldbkgrnClr,
          radius: 25,
          child: Stack(children: [
            Center(child: Icon(icon)),
            Align(
                alignment: Alignment.topRight,
                child: Obx(() => Text(
                      controller.count.toString(),
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ))),
          ]),
        ));
  }
}
