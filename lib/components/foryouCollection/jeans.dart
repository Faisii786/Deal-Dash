import 'package:e_commerce_app/Model/clothes_model.dart';
import 'package:e_commerce_app/widgets/foryou_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Jeans extends StatefulWidget {
  final List images = [
    ClothesModel(
      img: 'assets/images/pants/pant1.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/pants/pant2.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/pants/pant3.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/pants/pant4.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/pants/pant5.jpg',
      ontap: () {},
    ),
  ];
  Jeans({super.key});

  @override
  State<Jeans> createState() => _JeansState();
}

class _JeansState extends State<Jeans> {
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
        title: Text("Man Jeans"),
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
