import 'package:flutter/material.dart';
import 'package:e_commerce_app/utility/colors.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final TextInputType keyboardType;

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.icon,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Expanded(
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            // contentPadding: const EdgeInsets.all(10),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            // enabledBorder: const OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.white54),
            // ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: isHovered ? Colors.white : Colors.grey,
              ),
            ),
            hintText: widget.hintText,
            hintStyle:
                TextStyle(color: AppColors().greykColor.withOpacity(0.8)),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
          ),
          keyboardType: widget.keyboardType,
          style: TextStyle(color: AppColors().whiteColor),
        ),
      ),
    );
  }
}
