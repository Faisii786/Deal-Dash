
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/widgets/cart&notifi.dart';
import 'package:e_commerce_app/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section1 extends StatelessWidget {
  const Section1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchTextField(),
        SizedBox(
          width: 5,
        ),
        CartAndNoticationIcon(
            icon: Icons.shopping_cart,
            onTap: () {
              Get.to(() => CartScreen());
            }),
        SizedBox(
          width: 5,
        ),
        CartAndNoticationIcon(icon: Icons.notifications, onTap: () {})
      ],
    );
  }
}
