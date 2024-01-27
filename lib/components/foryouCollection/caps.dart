import 'package:e_commerce_app/Model/clothes_model.dart';
import 'package:e_commerce_app/widgets/foryou_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Caps extends StatefulWidget {
  final List images = [
    ClothesModel(img: 'assets/images/Man T-Shirts/shirt8.jpg'),
    ClothesModel(img: 'assets/images/Man T-Shirts/shirt2.jpg'),
    ClothesModel(img: 'assets/images/Man T-Shirts/shirt3.jpg'),
    ClothesModel(img: 'assets/images/Man T-Shirts/shirt4.jpeg'),
    ClothesModel(img: 'assets/images/Man T-Shirts/shirt6.jpg'),
    ClothesModel(img: 'assets/images/Man T-Shirts/shirt7.jpg'),
    ClothesModel(img: 'assets/images/Man T-Shirts/shirt8.jpg'),
    ClothesModel(img: 'assets/images/Man T-Shirts/shirt9.jpg'),
    ClothesModel(img: 'assets/images/Man T-Shirts/shirt10.jpg'),
  ];
  Caps({super.key});

  @override
  State<Caps> createState() => _CapsState();
}

class _CapsState extends State<Caps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
        title: Text("Man Shirts"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: GridView.builder(
            itemCount: widget.images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 5),
            itemBuilder: (context, index) {
              return ReturnCustomMaterial(clothes: widget.images[index]);
            }),
      ),
    );
  }
}
