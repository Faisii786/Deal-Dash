import 'package:e_commerce_app/components/foryouCollection/hoddies.dart';
import 'package:e_commerce_app/components/foryouCollection/mouse_purple.dart';
import 'package:e_commerce_app/components/foryouCollection/mouse_white.dart';
import 'package:e_commerce_app/components/special_for_you.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialForYouSection extends StatelessWidget {
  const SpecialForYouSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SpecialforYou(
              ontap: () {
                Get.to(() => Hoddies());
              },
              img: 'assets/images/hoddies/hodBkgrnd.png'),
          SizedBox(
            width: 5,
          ),
          SpecialforYou(
              ontap: () {
                Get.to(() => WhiteMouse());
              },
              img: 'assets/images/Image Banner 2.png'),
          SizedBox(
            width: 5,
          ),
          SpecialforYou(
              ontap: () {
                Get.to(() => PurpleMouse());
              },
              img: 'assets/images/Image Banner 3.png'),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
