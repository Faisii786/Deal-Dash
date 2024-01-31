import 'package:e_commerce_app/Model/products_model.dart';
import 'package:e_commerce_app/screens/foryou%20Products/widgets/foryou_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurpleMouse extends StatefulWidget {
  final List images = [
    ClothesModel(
      img: 'assets/images/mouse/mouse5.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/mouse/mouse6.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/mouse/mouse7.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/mouse/mouse8.png',
      ontap: () {},
    ),
  ];
  PurpleMouse({super.key});

  @override
  State<PurpleMouse> createState() => _PurpleMouseState();
}

class _PurpleMouseState extends State<PurpleMouse> {
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
        title: Text("Man Shoes"),
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
