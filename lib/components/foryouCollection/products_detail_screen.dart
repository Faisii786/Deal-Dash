import 'package:e_commerce_app/State%20Managment/state_managment.dart';
import 'package:e_commerce_app/widgets/productsDetailedWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetailScreen extends StatefulWidget {
  ProductsDetailScreen({super.key});

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  final stateController controller = Get.put(stateController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProductsDetailScreenWdget(controller: controller),
      ),
    );
  }
}
