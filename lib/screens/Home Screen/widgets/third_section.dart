
import 'package:e_commerce_app/screens/Home%20Screen/widgets/categories.dart';
import 'package:flutter/material.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Categories(icon: Icons.gamepad_outlined, catName: 'Game'),
          SizedBox(
            width: 10,
          ),
          Categories(icon: Icons.payment, catName: 'Bill'),
          SizedBox(
            width: 10,
          ),
          Categories(
              icon: Icons.wallet_giftcard_outlined,
              catName: 'Daily Gift'),
          SizedBox(
            width: 10,
          ),
          Categories(icon: Icons.more_horiz_sharp, catName: 'More'),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
