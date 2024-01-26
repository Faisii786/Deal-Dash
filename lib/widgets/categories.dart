import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  final IconData icon;
  final String catName;
  const Categories({super.key, required this.icon, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: Get.width * 0.2,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 218, 182, 116),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 30,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(catName),
      ],
    );
  }
}
