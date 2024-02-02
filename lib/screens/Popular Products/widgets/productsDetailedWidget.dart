// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetailScreenWidget extends StatelessWidget {
  String title;
  String price;
  String image;

  ProductsDetailScreenWidget(this.title, this.image, this.price);
  Color myColor = Color(0xFF95353D);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.red,
          ),
          //Title-Container
          Container(
            width: Get.width,
            height: Get.height * 0.31,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Code Here",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // //Price-Container
          Positioned(
            top: 100,
            child: Container(
              width: Get.width * 0.2,
              height: Get.height * 0.5,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price",
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    Text(price,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          //Second Main Container
          Positioned(
            top: Get.height * 0.45,
            child: SingleChildScrollView(
              child: Container(
                width: Get.width,
                height: Get.height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                          "Lorem ipsum dolor ss vitae justo vulp, elit libero posuere libero, vel ultricies nunc augue vel lacus. Ut ullamcorper risus quis purus cursus, vel pulvinar odio condimentum. Maecenas vel tristique libero."),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //image Container
          Positioned(
            top: 130,
            left: 95,
            child: Container(
              width: Get.width * 0.7,
              height: Get.height * 0.4,
              color: Colors.transparent,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Buttons Row
          Positioned(
            top: 570,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.cart_fill,
                              color: Colors.blue,
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: Get.width * 0.79,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'BUY NOW',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color?>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.blue, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce_app/State%20Managment/toogleFav.dart';
// import 'package:e_commerce_app/screens/Cart%20Screen/buy_now.dart';
// import 'package:e_commerce_app/screens/Home%20Screen/bottom_navBar.dart';
// import 'package:e_commerce_app/res/colors.dart';
// import 'package:e_commerce_app/screens/Cart%20Screen/addToCartButton.dart';
// import 'package:e_commerce_app/utils/utills.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // ignore: must_be_immutable
// class ProductsDetailScreenWidget extends StatefulWidget {
//   final String img;
//   final String rating;
//   final String name;
//   final String price;

//   ProductsDetailScreenWidget({
//     super.key,
//     required this.controller,
//     required this.img,
//     required this.rating,
//     required this.name,
//     required this.price,
//   });

//   final toggleFav controller;

//   @override
//   State<ProductsDetailScreenWidget> createState() =>
//       _ProductsDetailScreenWidgetState();
// }

// class _ProductsDetailScreenWidgetState
//     extends State<ProductsDetailScreenWidget> {
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future addToCart() async {
//     try {
//       setState(() {
//         loading = true;
//       });

//       final userID = FirebaseAuth.instance.currentUser!.uid;
//       final cartCollection = _firestore.collection("productsData");

//       await cartCollection.add({
//         'id': userID,
//         'image': widget.img,
//         'rating': widget.rating,
//         'name': widget.name,
//         'price': widget.price,
//       });

//       utills.snackbarTop("Success", "Data is successfully added");
//       setState(() {
//         loading = true;
//       });
//       Get.to(() => MyBottomNavbar());
//     } on FirebaseException catch (err) {
//       utills.snackbarTop("Error", err.toString());
//       setState(() {
//         loading = false;
//       });
//     } catch (e) {
//       utills.snackbarTop("Error", e.toString());
//       setState(() {
//         loading = false;
//       });
//     }
//   }

//   bool loading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           leading: GestureDetector(
//               onTap: () {
//                 Get.back();
//               },
//               child: Icon(
//                 Icons.arrow_back_ios,
//                 color: AppColors().blackColor,
//               )),
//           actions: [
//             GestureDetector(
//               onTap: () {
//                 widget.controller.toogleFavorite();
//                 widget.controller.increaseFavCount();
//               },
//               child: Obx(
//                 () => Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Icon(
//                     widget.controller.fav.isFalse
//                         ? Icons.favorite_outline
//                         : Icons.favorite,
//                     color: widget.controller.fav.isTrue
//                         ? Colors.red
//                         : Colors.black,
//                     size: 25,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 30),
//                       child: Center(
//                         child: Image.asset(
//                           widget.img,
//                           fit: BoxFit.cover,
//                           width: 300,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: Get.height,
//                     decoration: BoxDecoration(
//                         color: AppColors().SearchTextFieldbkgrnClr,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(30),
//                             topRight: Radius.circular(30))),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 30, horizontal: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.rating,
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 2,
//                           ),
//                           Text(
//                             widget.name,
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             widget.price,
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 color: const Color.fromARGB(255, 194, 27, 15)),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             'In Stock',
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             'This versatile shirt is designed with both fashion and comfort in mind. Its carefully crafted to ensure a high level of quality.',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           SizedBox(height: 20),
//                           Row(
//                             children: [
//                               AddToCartButton(
//                                   loading: loading,
//                                   onPressed: () {
//                                     addToCart();
//                                   }),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               BuyButton(text: 'Buy Now')
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));

//     // return CustomScrollView(
//     //   slivers: [
//     //     SliverAppBar(
//     //       leading: GestureDetector(
//     //           onTap: () {
//     //             Get.back();
//     //           },
//     //           child: Icon(
//     //             Icons.arrow_back_ios,
//     //             color: AppColors().blackColor,
//     //           )),
//     //       automaticallyImplyLeading: false,
//     //       expandedHeight: Get.height * 0.5,
//     //       pinned: true,
//     //       flexibleSpace: FlexibleSpaceBar(
//     //         background: Padding(
//     //           padding: const EdgeInsets.symmetric(horizontal: 10),
//     //           child: Image.asset(
//     //             widget.img,
//     //             fit: BoxFit.contain,
//     //           ),
//     //         ),
//     //       ),
//     //       actions: [
//     //         Padding(
//     //           padding: const EdgeInsets.all(8.0),
//     //     child: GestureDetector(
//     //       onTap: () {
//     //         widget.controller.toogleFavorite();
//     //         widget.controller.increaseFavCount();
//     //       },
//     //       child: Obx(
//     //         () => Icon(
//     //           widget.controller.fav.isFalse
//     //               ? Icons.favorite_outline
//     //               : Icons.favorite,
//     //           color: widget.controller.fav.isTrue
//     //               ? Colors.red
//     //               : Colors.black,
//     //           size: 25,
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     // ],
//     //     ),
//     //   SliverToBoxAdapter(
//     //     child: Card(
//     //       margin: EdgeInsets.all(0),
//     //       child: Padding(
//     //         padding: const EdgeInsets.all(10.0),
//     //         child: Column(
//     //           crossAxisAlignment: CrossAxisAlignment.start,
//     //           children: [
//     //             Row(
//     //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //               children: [
//     //                 Text(
//     //                   widget.rating,
//     //                   style: TextStyle(
//     //                     fontSize: 20,
//     //                   ),
//     //                 ),
//     //                 Padding(
//     //                   padding: const EdgeInsets.only(right: 10),
//     //                   child: GestureDetector(
//     //                     onTap: () {},
//     //                     child: Icon(
//     //                       Icons.share,
//     //                       color: Colors.black,
//     //                     ),
//     //                   ),
//     //                 )
//     //               ],
//     //             ),
//     //             SizedBox(
//     //               height: 2,
//     //             ),
//     //             Text(
//     //               widget.name,
//     //               style: TextStyle(
//     //                 fontSize: 20,
//     //               ),
//     //             ),
//     //             SizedBox(
//     //               height: 5,
//     //             ),
//     //             Text(
//     //               widget.price,
//     //               style: TextStyle(
//     //                 fontSize: 20,
//     //               ),
//     //             ),
//     //             SizedBox(
//     //               height: 5,
//     //             ),
//     //             Row(
//     //               children: [
//     //                 Text(
//     //                   'Stock : ',
//     //                   style: TextStyle(
//     //                     fontSize: 18,
//     //                   ),
//     //                 ),
//     //                 Text(
//     //                   'In Stock',
//     //                   style: TextStyle(
//     //                     fontSize: 18,
//     //                   ),
//     //                 ),
//     //               ],
//     //             ),
//     //             SizedBox(
//     //               height: 20,
//     //             ),
//     //             Text(
//     //               'This versatile shirt is designed with both fashion and comfort in mind. Its carefully crafted to ensure a high level of quality.',
//     //               style: TextStyle(fontSize: 18),
//     //             ),
//     //             SizedBox(height: 20),
//     //             AddToCartButton(
//     //                 loading: loading,
//     //                 text: 'Add to Cart',
//     //                 onPressed: () {
//     //                   addToCart();
//     //                 }),
//     //           ],
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     // ],
//     // );
//   }
// }
