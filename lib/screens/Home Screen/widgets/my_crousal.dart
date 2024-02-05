import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCaraousalSlider extends StatelessWidget {
  MyCaraousalSlider({super.key});

  // Define a list of image paths for the carousel
  final List<String> carouselImages = [
    'assets/images/jackets.jpg',
    'assets/images/shirts.jpg',
    'assets/images/coat.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        animateToClosest: true,
        height: 250,
        autoPlay: true,
        enableInfiniteScroll: true,
        viewportFraction: 1.0,
        autoPlayCurve: Curves.easeInSine,
      ),
      items: carouselImages.map((imagePath) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(image: AssetImage(imagePath))),
        );
      }).toList(),
    );
  }
}
