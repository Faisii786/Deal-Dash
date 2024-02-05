import 'package:e_commerce_app/State%20Managment/theme.dart';
import 'package:e_commerce_app/screens/Home%20Screen/widgets/my_crousal.dart';
import 'package:e_commerce_app/screens/Home%20Screen/widgets/my_drawer.dart';
import 'package:e_commerce_app/screens/foryou%20Products/foyou_section.dart';
import 'package:e_commerce_app/screens/Popular%20Products/popular_products_section.dart';
import 'package:e_commerce_app/screens/Home%20Screen/widgets/section1.dart';
import 'package:e_commerce_app/screens/Home%20Screen/widgets/cashback.dart';
import 'package:e_commerce_app/screens/Home%20Screen/widgets/offerHeadings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    changeTheme _controller = Get.put(changeTheme());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Deal Dash",
              style: TextStyle(fontFamily: 'Muli1'),
            ),
            centerTitle: true,
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Obx(
                    () => _controller.theme.isFalse
                        ? GestureDetector(
                            onTap: () {
                              _controller.changeThemeLightAndDark();
                              Get.changeTheme(ThemeData.dark());
                            },
                            child: Icon(Icons.light_mode))
                        : GestureDetector(
                            onTap: () {
                              _controller.changeThemeLightAndDark();
                              Get.changeTheme(ThemeData.light());
                            },
                            child: Icon(
                              Icons.dark_mode,
                              size: 22,
                            ),
                          ),
                  )),
            ],
          ),
          drawer: MyDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Section1(),
                  SizedBox(
                    height: 10,
                  ),
                  CashBackContainer(),
                  SizedBox(
                    height: 10,
                  ),
                  MyCaraousalSlider(),
                  SizedBox(
                    height: 10,
                  ),
                  OffersHeadings(heading: 'Special for you'),
                  SizedBox(
                    height: 10,
                  ),
                  PopuarProductsSection(),
                  SizedBox(
                    height: 10,
                  ),
                  OffersHeadings(heading: 'Popular Products'),
                  SizedBox(
                    height: 10,
                  ),
                  SpecialForYouSection(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
