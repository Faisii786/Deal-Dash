import 'package:e_commerce_app/State%20Managment/state_managment.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/addToCartButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetailScreen extends StatefulWidget {
  const ProductsDetailScreen({super.key});

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  final stateController controller = Get.put(stateController());

  @override
  Widget build(BuildContext context) {
    print("rebuild");
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
                    color: AppColors().blackColor,
                  )),
              automaticallyImplyLeading: false,
              expandedHeight: Get.height * 0.5,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/ps4_console_white_1.png",
                  fit: BoxFit.contain,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        controller.toogleFavorite();
                      },
                      child: Obx(
                        () => Icon(
                          controller.fav.isFalse
                              ? Icons.favorite_outline
                              : Icons.favorite,
                          color:
                              controller.fav.isTrue ? Colors.red : Colors.black,
                          size: 25,
                        ),
                      )),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 231, 230, 230),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "5.0",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 30,
                                  color: Colors.orange,
                                ),
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
                        Text(
                          'Wireless Controller for PS4',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '122.6\$ - 334.0\$',
                          style: TextStyle(
                            fontSize: 20,
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
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'In Stock',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'This versatile shirt is designed with both fashion and comfort in mind. Its carefully crafted to ensure a high level of quality.',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        AddToCartButton(text: 'Add to Cart', onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
