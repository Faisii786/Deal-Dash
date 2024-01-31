import 'package:e_commerce_app/Model/products_model.dart';
import 'package:e_commerce_app/screens/foryou%20Products/widgets/foryou_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhiteMouse extends StatefulWidget {
  final List<ClothesModel> images = [
    ClothesModel(
      img: 'assets/images/mouse/mouse1.png',
      ontap: () {
        
      },
    ),
    ClothesModel(
      img: 'assets/images/mouse/mouse2.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/mouse/mouse3.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/mouse/mouse4.png',
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
        title: Text("HeadSet"),
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
