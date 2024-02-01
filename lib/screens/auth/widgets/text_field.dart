import 'package:flutter/material.dart';
import 'package:e_commerce_app/utility/colors.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.controller,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isHovered ? Colors.white : Colors.grey,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: AppColors().greykColor.withOpacity(0.8), fontSize: 18),
        labelText: widget.labelText,
        labelStyle:
            TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 18),
      ),
      keyboardType: widget.keyboardType,
      style: TextStyle(color: AppColors().whiteColor),
    );
  }
}
