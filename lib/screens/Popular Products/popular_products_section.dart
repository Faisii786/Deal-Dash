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
            img: "assets/images/mouse/bmouse.jpg",
            onTap: () {
              Get.to(() => ProductsDetailScreenWidget(
                  'Playstation 4',
                  'assets/images/mouse/mouse1.png',
                  '1500',
                  'PS4 Console 500 GB White - Playstation 4 \nPlayStation 4 redefines rich and immersive gameplay with powerful graphics and speed, intelligent personalisation, deeply integrated social capabilities, and innovative second-screen features Background downloading and updating capability also allows you to immediately play digital titles.'));
            },
          ),
          SizedBox(
            width: 10,
          ),
          PopularProducts(
            img: "assets/images/mouse/headset.jpg",
            onTap: () {
              Get.to(() => ProductsDetailScreenWidget(
                  'hello',
                  'assets/images/app_icon.png',
                  '1300',
                  'hsahgdgjdhsdjagjgdgajdadjsadgadgsadjag'));
            },
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
