import 'package:e_commerce_app/screens/Home%20Screen/widgets/cart&notifi.dart';
import 'package:e_commerce_app/screens/Home%20Screen/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

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
        CartAndNoticationIcon(icon: Icons.favorite_outline, onTap: () {}),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
