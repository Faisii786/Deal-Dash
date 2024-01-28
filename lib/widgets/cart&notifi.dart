import 'package:e_commerce_app/Model/count_class.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';

class CartAndNoticationIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  CartAndNoticationIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    CountClass _count = CountClass();
    return GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: AppColors().SearchTextFieldbkgrnClr,
          radius: 25,
          child: Stack(children: [
            Center(child: Icon(icon)),
            Align(
                alignment: Alignment.topRight,
                child: Text(
                  _count.count.toString(),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ))
          ]),
        ));
  }
}
