import 'package:e_commerce_app/resouces/colors.dart';
import 'package:get/get.dart';

class utills {
  //SnackBars
  static snackbarTop(String message) {
    Get.snackbar(
      '',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors().backgroundColor2,
      colorText: AppColors().whiteColor,
      duration: Duration(seconds: 2),
    );
  }

  static snackbarBottom(String message) {
    Get.snackbar(
      '',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors().backgroundColor2,
      colorText: AppColors().whiteColor,
      duration: Duration(seconds: 2),
    );
  }
}
