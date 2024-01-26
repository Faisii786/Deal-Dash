import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';

class CartAndNoticationIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  CartAndNoticationIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors().SearchTextFieldbkgrnClr,
        radius: 25,
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
