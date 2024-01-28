import 'package:e_commerce_app/Model/clothes_model.dart';
import 'package:e_commerce_app/components/foryouCollection/products_detail_screen.dart';
import 'package:e_commerce_app/widgets/foryou_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhiteMouse extends StatefulWidget {
  final List<ClothesModel> images = [
    ClothesModel(
      img: 'assets/images/ps4_console_white_1.png',
      ontap: () {
        Get.to(() => ProductsDetailScreen());
      },
    ),
    ClothesModel(
      img: 'assets/images/ps4_console_white_2.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/ps4_console_white_3.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/ps4_console_white_4.png',
      ontap: () {},
    ),
  ];

  WhiteMouse({super.key});

  @override
  State<WhiteMouse> createState() => _WhiteMouseState();
}

class _WhiteMouseState extends State<WhiteMouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: false,
        title: Text("Man Shirts"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: GridView.builder(
          itemCount: widget.images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ReturnCustomMaterial(
              clothes: widget.images[index],
            );
          },
        ),
      ),
    );
  }
}
