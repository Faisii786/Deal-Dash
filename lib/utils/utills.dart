import 'package:e_commerce_app/res/colors.dart';
import 'package:get/get.dart';

class utills {
  //SnackBars
  static snackbarTop(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors().backgroundColor2,
      colorText: AppColors().whiteColor,
      duration: Duration(seconds: 2),
    );
  }

  static snackbarBottom(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors().backgroundColor2,
      colorText: AppColors().whiteColor,
      duration: Duration(seconds: 2),
    );
  }

}
