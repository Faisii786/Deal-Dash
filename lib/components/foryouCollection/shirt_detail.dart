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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "5.0",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          width: Get.width * 0.14,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange),
                          child: Center(
                            child: Text(
                              "78 %",
                              style: TextStyle(color: AppColors().blackColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '122.6\$ - 334.0\$',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Black Nike T-Shirt',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Stock : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'In Stock',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors().blackColor,
                          child: Center(
                            child: Icon(
                              Icons.done,
                              color: AppColors().whiteColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'This versatile shirt is designed with both fashion and comfort in mind. Its carefully crafted to ensure a high level of quality.',
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
