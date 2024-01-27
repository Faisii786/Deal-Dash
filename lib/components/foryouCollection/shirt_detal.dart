import 'package:e_commerce_app/Model/cart_model.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/addToCartButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShirtDetailScreen extends StatefulWidget {
  const ShirtDetailScreen({super.key});

  @override
  State<ShirtDetailScreen> createState() => _ShirtDetailScreenState();
}

class _ShirtDetailScreenState extends State<ShirtDetailScreen> {
  bool _fav = false;

  void _toggleFavorite() {
    setState(() {
      _fav = !_fav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors().whiteColor,
                  )),
              automaticallyImplyLeading: false,
              expandedHeight: Get.height * 0.6,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/Man T-Shirts/shirt8.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _toggleFavorite();
                    },
                    child: Icon(
                      _fav ? Icons.favorite_outline : Icons.favorite,
                      color: _fav ? AppColors().whiteColor : Colors.yellow,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Black T-Shirt',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '200\$',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'This versatile shirt is designed with both fashion and comfort in mind. Its carefully crafted to ensure a high level of quality. Whether youre dressing up for a special occasion or keeping it casual, this shirt will elevate your style effortlessly. If youd like more details about specific features or colors, please let me know, and Ill be happy to provide more information',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    AddToCartButton(
                        text: 'Add to Cart',
                        onPressed: () {
                          cart.addToCart(Product(name: 'Shirt', price: 4));
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
