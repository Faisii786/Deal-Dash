import 'package:e_commerce_app/Model/products_model.dart';
import 'package:e_commerce_app/screens/foryou%20Products/widgets/foryou_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Hoddies extends StatefulWidget {
  final List images = [
    ClothesModel(
      img: 'assets/images/hoddies/hod1.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/hoddies/hod2.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/hoddies/hod3.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/hoddies/hod4.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/hoddies/hod5.jpg',
      ontap: () {},
    ),
  ];
  Hoddies({super.key});

  @override
  State<Hoddies> createState() => _HoddiesState();
}

class _HoddiesState extends State<Hoddies> {
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
        title: Text("Man Hoodies"),
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
