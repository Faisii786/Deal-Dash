import 'package:e_commerce_app/screens/auth/theme/theme.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  const MyTextField({
    super.key,
    required this.name,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        //contentPadding: const EdgeInsets.all(10),
        fillColor: lightColorScheme.outlineVariant,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        labelText: name ?? "",
        labelStyle: TextStyle(color: AppColors().blackColor),
      ),
      style: TextStyle(color: AppColors().blackColor, fontSize: 17),
    );
  }
}
