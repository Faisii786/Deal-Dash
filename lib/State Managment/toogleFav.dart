import 'package:e_commerce_app/utils/utills.dart';
import 'package:get/get.dart';

class toggleFavController extends GetxController {
  RxBool fav = false.obs;
  RxInt count = 0.obs;

  toogleFavorite() {
    fav.value = !fav.value;
    print(fav.value);
  }

  increaseFavCount() {
    if (fav.value == true) {
      count.value++;
      print(count.value);
      utills.snackbarBottom("Favourite", "Item is added to favourite");
    } else if (fav.value == false) {
      count.value--;
      print(count.value);
      utills.snackbarBottom("unFavourite", "Item is unfavourite");
    }
  }
}
