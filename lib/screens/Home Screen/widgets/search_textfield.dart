import 'package:flutter/material.dart';
import 'package:e_commerce_app/resouces/colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.all(5),
          fillColor: AppColors().SearchTextFieldbkgrnClr,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search),
          labelText: 'Search product',
          labelStyle: TextStyle(color: AppColors().blackColor),
        ),
        style: TextStyle(color: AppColors().blackColor),
      ),
    );
  }
}
