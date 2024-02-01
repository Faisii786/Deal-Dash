import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCaraousalSlider extends StatelessWidget {
  MyCaraousalSlider({super.key});

  // Define a list of image paths for the carousel
  final List<String> carouselImages = [
    'assets/images/Image Banner 2.png',
    'assets/images/Image Banner 3.png',
    'assets/images/Image Banner 2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enableInfiniteScroll: true,
          viewportFraction: 1.0,
          autoPlayCurve: Curves.easeInSine),
      items: carouselImages.map((imagePath) {
        return Image.asset(
          imagePath,
          fit: BoxFit.cover,
        );
      }).toList(),
    );
  }
}
