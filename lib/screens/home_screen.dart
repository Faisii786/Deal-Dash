import 'package:e_commerce_app/components/foryouCollection/caps.dart';
import 'package:e_commerce_app/components/foryouCollection/hoddies.dart';
import 'package:e_commerce_app/components/foryouCollection/jeans.dart';
import 'package:e_commerce_app/components/foryouCollection/shirts.dart';
import 'package:e_commerce_app/components/foryouCollection/track_suits.dart';
import 'package:e_commerce_app/widgets/cart&notifi.dart';
import 'package:e_commerce_app/components/cashback.dart';
import 'package:e_commerce_app/widgets/categories.dart';
import 'package:e_commerce_app/widgets/offerHeadings.dart';
import 'package:e_commerce_app/widgets/popular_products.dart';
import 'package:e_commerce_app/widgets/search_textfield.dart';
import 'package:e_commerce_app/components/special_for_you.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  SearchTextField(),
                  SizedBox(
                    width: 5,
                  ),
                  CartAndNoticationIcon(
                      icon: Icons.shopping_cart, onTap: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  CartAndNoticationIcon(icon: Icons.notifications, onTap: () {})
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CashBackContainer(),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Categories(icon: Icons.gamepad_outlined, catName: 'Game'),
                    SizedBox(
                      width: 10,
                    ),
                    Categories(icon: Icons.payment, catName: 'Bill'),
                    SizedBox(
                      width: 10,
                    ),
                    Categories(
                        icon: Icons.wallet_giftcard_outlined,
                        catName: 'Daily Gift'),
                    SizedBox(
                      width: 10,
                    ),
                    Categories(icon: Icons.more_horiz_sharp, catName: 'More'),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OffersHeadings(heading: 'Special for you'),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SpecialforYou(
                        ontap: () {
                          Get.to(() => ManTShirts());
                        },
                        img: 'assets/images/Man T-Shirts/shirt7.jpg'),
                    SizedBox(
                      width: 5,
                    ),
                    SpecialforYou(
                        ontap: () {
                          Get.to(() => Hoddies());
                        },
                        img: 'assets/images/hoddies/hodBkgrnd.png'),
                    SizedBox(
                      width: 5,
                    ),
                    SpecialforYou(
                        ontap: () {
                          Get.to(() => Jeans());
                        },
                        img: 'assets/images/pants/cardPant.jpg'),
                    SizedBox(
                      width: 5,
                    ),
                    SpecialforYou(
                        ontap: () {
                          Get.to(() => Caps());
                        },
                        img: 'assets/images/Man T-Shirts/shirt7.jpg'),
                    SizedBox(
                      width: 5,
                    ),
                    SpecialforYou(
                        ontap: () {
                          Get.to(() => TrackSuits());
                        },
                        img: 'assets/images/trackSuits/tr1.png'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              OffersHeadings(heading: 'Popular Products'),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PopularProducts(),
                    SizedBox(
                      width: 5,
                    ),
                    PopularProducts(),
                    SizedBox(
                      width: 5,
                    ),
                    PopularProducts(),
                    SizedBox(
                      width: 5,
                    ),
                    PopularProducts(),
                    SizedBox(
                      width: 5,
                    ),
                    PopularProducts(),
                    SizedBox(
                      width: 5,
                    ),
                    PopularProducts(),
                    SizedBox(
                      width: 5,
                    ),
                    PopularProducts(),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
