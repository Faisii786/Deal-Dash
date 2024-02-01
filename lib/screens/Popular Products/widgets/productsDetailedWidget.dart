import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/State%20Managment/toogleFav.dart';
import 'package:e_commerce_app/screens/Cart%20Screen/buy_now.dart';
import 'package:e_commerce_app/screens/Home%20Screen/bottom_navBar.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/screens/Cart%20Screen/addToCartButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductsDetailScreenWidget extends StatefulWidget {
  final String img;
  final String rating;
  final String name;
  final String price;

  ProductsDetailScreenWidget({
    super.key,
    required this.controller,
    required this.img,
    required this.rating,
    required this.name,
    required this.price,
  });

  final toggleFav controller;

  @override
  State<ProductsDetailScreenWidget> createState() =>
      _ProductsDetailScreenWidgetState();
}

class _ProductsDetailScreenWidgetState
    extends State<ProductsDetailScreenWidget> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addToCart() async {
    try {
      setState(() {
        loading = true;
      });

      final userID = FirebaseAuth.instance.currentUser!.uid;
      final cartCollection = _firestore.collection("productsData");

      await cartCollection.add({
        'id': userID,
        'image': widget.img,
        'rating': widget.rating,
        'name': widget.name,
        'price': widget.price,
      });

      Get.snackbar("Added", 'Data is successfully added to cart',
          duration: Duration(seconds: 3));
      setState(() {
        loading = true;
      });
      Get.to(() => MyBottomNavbar());
    } on FirebaseException catch (err) {
      Get.snackbar("Error", err.toString(),
          snackPosition: SnackPosition.BOTTOM);
      setState(() {
        loading = false;
      });
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      setState(() {
        loading = false;
      });
    }
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors().blackColor,
              )),
          actions: [
            GestureDetector(
              onTap: () {
                widget.controller.toogleFavorite();
                widget.controller.increaseFavCount();
              },
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    widget.controller.fav.isFalse
                        ? Icons.favorite_outline
                        : Icons.favorite,
                    color: widget.controller.fav.isTrue
                        ? Colors.red
                        : Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      child: Center(
                        child: Image.asset(
                          widget.img,
                          fit: BoxFit.cover,
                          width: 300,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height,
                    decoration: BoxDecoration(
                        color: AppColors().SearchTextFieldbkgrnClr,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.rating,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.price,
                            style: TextStyle(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 194, 27, 15)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'In Stock',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'This versatile shirt is designed with both fashion and comfort in mind. Its carefully crafted to ensure a high level of quality.',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              AddToCartButton(
                                  loading: loading,
                                  onPressed: () {
                                    addToCart();
                                  }),
                              SizedBox(
                                width: 5,
                              ),
                              BuyButton(text: 'Buy Now')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));

    // return CustomScrollView(
    //   slivers: [
    //     SliverAppBar(
    //       leading: GestureDetector(
    //           onTap: () {
    //             Get.back();
    //           },
    //           child: Icon(
    //             Icons.arrow_back_ios,
    //             color: AppColors().blackColor,
    //           )),
    //       automaticallyImplyLeading: false,
    //       expandedHeight: Get.height * 0.5,
    //       pinned: true,
    //       flexibleSpace: FlexibleSpaceBar(
    //         background: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 10),
    //           child: Image.asset(
    //             widget.img,
    //             fit: BoxFit.contain,
    //           ),
    //         ),
    //       ),
    //       actions: [
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //     child: GestureDetector(
    //       onTap: () {
    //         widget.controller.toogleFavorite();
    //         widget.controller.increaseFavCount();
    //       },
    //       child: Obx(
    //         () => Icon(
    //           widget.controller.fav.isFalse
    //               ? Icons.favorite_outline
    //               : Icons.favorite,
    //           color: widget.controller.fav.isTrue
    //               ? Colors.red
    //               : Colors.black,
    //           size: 25,
    //         ),
    //       ),
    //     ),
    //   ),
    // ],
    //     ),
    //   SliverToBoxAdapter(
    //     child: Card(
    //       margin: EdgeInsets.all(0),
    //       child: Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text(
    //                   widget.rating,
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(right: 10),
    //                   child: GestureDetector(
    //                     onTap: () {},
    //                     child: Icon(
    //                       Icons.share,
    //                       color: Colors.black,
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //             SizedBox(
    //               height: 2,
    //             ),
    //             Text(
    //               widget.name,
    //               style: TextStyle(
    //                 fontSize: 20,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             Text(
    //               widget.price,
    //               style: TextStyle(
    //                 fontSize: 20,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             Row(
    //               children: [
    //                 Text(
    //                   'Stock : ',
    //                   style: TextStyle(
    //                     fontSize: 18,
    //                   ),
    //                 ),
    //                 Text(
    //                   'In Stock',
    //                   style: TextStyle(
    //                     fontSize: 18,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Text(
    //               'This versatile shirt is designed with both fashion and comfort in mind. Its carefully crafted to ensure a high level of quality.',
    //               style: TextStyle(fontSize: 18),
    //             ),
    //             SizedBox(height: 20),
    //             AddToCartButton(
    //                 loading: loading,
    //                 text: 'Add to Cart',
    //                 onPressed: () {
    //                   addToCart();
    //                 }),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // ],
    // );
  }
}
