import 'package:e_commerce_app/widgets/cart&notifi.dart';
import 'package:e_commerce_app/widgets/cashback.dart';
import 'package:e_commerce_app/widgets/categories.dart';
import 'package:e_commerce_app/widgets/offerHeadings.dart';
import 'package:e_commerce_app/widgets/popular_products.dart';
import 'package:e_commerce_app/widgets/search_textfield.dart';
import 'package:e_commerce_app/widgets/special_for_you.dart';
import 'package:flutter/material.dart';

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
                    SpecialforYou(),
                    SizedBox(
                      width: 5,
                    ),
                    SpecialforYou(),
                    SizedBox(
                      width: 5,
                    ),
                    SpecialforYou(),
                    SizedBox(
                      width: 5,
                    ),
                    SpecialforYou(),
                    SizedBox(
                      width: 5,
                    ),
                    SpecialforYou(),
                    SizedBox(
                      width: 5,
                    ),
                    SpecialforYou(),
                    SizedBox(
                      width: 5,
                    ),
                    SpecialforYou(),
                    SizedBox(
                      width: 5,
                    ),
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
