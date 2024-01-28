import 'package:e_commerce_app/widgets/popular_products_container.dart';
import 'package:flutter/material.dart';

class PopuarProductsSection extends StatelessWidget {
  const PopuarProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PopularProducts(
            img: "assets/images/ps4_console_white_1.png",
          ),
          SizedBox(
            width: 5,
          ),
          PopularProducts(
            img: "assets/images/Image Popular Product 2.png",
          ),
          SizedBox(
            width: 5,
          ),
          PopularProducts(
            img: "assets/images/Image Popular Product 3.png",
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}