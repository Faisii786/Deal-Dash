import 'package:e_commerce_app/screens/auth/theme/theme.dart';
import 'package:e_commerce_app/resouces/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const MyTextField({
    super.key,
    required this.name,
    this.controller,
    this.validator, // Validator parameter added
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
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
        labelText: name,
        labelStyle: TextStyle(color: AppColors().blackColor),
      ),
      style: TextStyle(color: AppColors().blackColor, fontSize: 17),
    );
  }
}
