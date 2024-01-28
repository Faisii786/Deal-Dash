import 'package:e_commerce_app/Model/clothes_model.dart';
import 'package:e_commerce_app/widgets/foryou_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurpleMouse extends StatefulWidget {
  final List images = [
    ClothesModel(
      img: 'assets/images/ps4_console_blue_1.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/ps4_console_blue_2.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/ps4_console_blue_3.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/ps4_console_blue_4.png',
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
