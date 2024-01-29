import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class stateController extends GetxController {
  RxBool fav = false.obs;
  RxInt count = 0.obs;

  toogleFavorite() {
    fav.value = !fav.value;
    print(fav.value);
  }

  // toogeleUnfavourite() {
  //   count.value--;
  //   print(count.value);
  // }

  increaseFavCount() {
    if (fav.value == true) {
      count.value++;
      print(count.value);
      Get.snackbar(
        "Favorite",
        "Item is added to Favourite",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 1),
        backgroundColor: AppColors().backgroundColor1,
        colorText: AppColors().whiteColor,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
      );
    } else if (fav.value == false) {
      count.value--;
      print(count.value);
      Get.snackbar(
        "Favorite",
        "Item is unFavourite",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 1),
        backgroundColor: AppColors().backgroundColor1,
        colorText: AppColors().whiteColor,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
      );
    }
    // fav.value = false;
    // count.value++;
    // print(count.value);
  }
}
