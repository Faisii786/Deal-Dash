// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class account_containers extends StatelessWidget {
  final IconData icon;
  final String name;
  bool hide;

  account_containers({
    super.key,
    required this.icon,
    required this.name,
    this.hide = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 16, fontFamily: "Muli6"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
