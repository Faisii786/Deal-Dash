import 'package:e_commerce_app/components/foyou_section.dart';
import 'package:e_commerce_app/components/popular_products_section.dart';
import 'package:e_commerce_app/components/section1.dart';
import 'package:e_commerce_app/components/third_section.dart';
import 'package:e_commerce_app/components/cashback.dart';
import 'package:e_commerce_app/widgets/offerHeadings.dart';
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
              Section1(),
              SizedBox(
                height: 20,
              ),
              CashBackContainer(),
              SizedBox(
                height: 20,
              ),
              ThirdSection(),
              SizedBox(
                height: 20,
              ),
              OffersHeadings(heading: 'Special for you'),
              SizedBox(
                height: 10,
              ),
              SpecialForYouSection(),
              SizedBox(
                height: 10,
              ),
              OffersHeadings(heading: 'Popular Products'),
              SizedBox(
                height: 10,
              ),
              PopuarProductsSection(),
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
