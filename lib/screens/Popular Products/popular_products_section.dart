//import 'package:e_commerce_app/State%20Managment/toogleFav.dart';
import 'package:e_commerce_app/screens/Popular%20Products/widgets/popular_products_container.dart';
import 'package:e_commerce_app/screens/Popular%20Products/widgets/productsDetailedWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopuarProductsSection extends StatelessWidget {
  const PopuarProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final toggleFav controller = Get.put(toggleFav());
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PopularProducts(
            img: "assets/images/mouse/mouse.png",
            onTap: () {
              Get.to(() => ProductsDetailScreenWidget(
                  '3200 dpi Mouse', 'assets/images/mouse/cmouse.png', '1500'));
            },
          ),
          SizedBox(
            width: 10,
          ),
          PopularProducts(
            img: "assets/images/mouse/headset.jpg",
            onTap: () {
              Get.to(() => ProductsDetailScreenWidget(
                  'hello', 'assets/images/mouse/mouse1.png', '1500'));
            },
          ),

          // PopularProducts(
          //   img: "assets/images/pant.png",
          //   onTap: () {
          //     Get.to(() => ProductsDetailScreenWidget(
          //           controller: controller,
          //           img: 'assets/images/pant.png',
          //           rating: '3.0',
          //           name: 'Trouser',
          //           price: '\$90.00',
          //         ));
          //   },
          // ),
          // SizedBox(
          //   width: 5,
          // ),
          // PopularProducts(
          //   img: "assets/images/glap.png",
          //   onTap: () {
          //     Get.to(() => ProductsDetailScreenWidget(
          //           controller: controller,
          //           img: 'assets/images/glap.png',
          //           rating: '4.3',
          //           name: 'Branded Glap',
          //           price: '\$50.65',
          //         ));
          //   },
          // ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
