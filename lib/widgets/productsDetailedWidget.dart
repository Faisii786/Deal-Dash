import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/State%20Managment/toogleFav.dart';
import 'package:e_commerce_app/screens/bottom_navBar.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/addToCartButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

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

      var id = Uuid().v1();

      DocumentSnapshot cartSnapshot =
          await _firestore.collection("productsData").doc(id).get();

      if (cartSnapshot.exists) {
        Get.snackbar("erro", "already error");
      } else {
        await _firestore.collection("productsData").doc(id).set({
          'id': id,
          "image": widget.img,
          'rating': widget.rating,
          'name': widget.name,
          'price': widget.price,
        }).then((value) => {
              Get.snackbar("Added", 'Data is successfully added to cart',
                  duration: Duration(seconds: 3)),
              setState(() {
                loading = true;
              }),
              Get.to(() => MyBottomNavbar()),
            });
      }
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
    return CustomScrollView(
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
            background: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                widget.img,
                fit: BoxFit.contain,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  widget.controller.toogleFavorite();
                  widget.controller.increaseFavCount();
                },
                child: Obx(
                  () => Icon(
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
        SliverToBoxAdapter(
          child: Container(
            height: Get.height,
            child: Card(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.rating,
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                    AddToCartButton(
                        loading: loading,
                        text: 'Add to Cart',
                        onPressed: () {
                          addToCart();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
