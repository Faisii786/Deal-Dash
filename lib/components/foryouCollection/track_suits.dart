import 'package:e_commerce_app/Model/clothes_model.dart';
import 'package:e_commerce_app/widgets/foryou_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackSuits extends StatefulWidget {
  final List images = [
    ClothesModel(
      img: 'assets/images/trackSuits/tr1.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/trackSuits/tr2.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/trackSuits/tr3.png',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/trackSuits/tr4.jpg',
      ontap: () {},
    ),
    ClothesModel(
      img: 'assets/images/trackSuits/tr5.jpg',
      ontap: () {},
    ),
  ];
  TrackSuits({super.key});

  @override
  State<TrackSuits> createState() => _TrackSuitsState();
}

class _TrackSuitsState extends State<TrackSuits> {
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
