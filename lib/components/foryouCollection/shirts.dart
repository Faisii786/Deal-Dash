import 'package:e_commerce_app/Model/clothes_model.dart';
import 'package:e_commerce_app/components/foryouCollection/shirt_detail.dart';
import 'package:e_commerce_app/widgets/foryou_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManTShirts extends StatefulWidget {
  final List<ClothesModel> images = [
    ClothesModel(
      img: 'assets/images/Man T-Shirts/shirt8.jpg',
      ontap: () {
        Get.to(() => ShirtDetailScreen());
      },
    ),
    ClothesModel(
      img: 'assets/images/Man T-Shirts/shirt2.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/Man T-Shirts/shirt3.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/Man T-Shirts/shirt4.jpeg',
      ontap: () {},
    ),
  ];

  ManTShirts({super.key});

  @override
  State<ManTShirts> createState() => _ManTShirtsState();
}

class _ManTShirtsState extends State<ManTShirts> {
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
