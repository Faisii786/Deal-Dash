import 'package:e_commerce_app/Model/count_class.dart';
import 'package:get/get.dart';

class stateController extends GetxController {
  RxBool fav = false.obs;

  toogleFavorite() {
    fav.value = !fav.value;
    CountClass().count++;
    print(CountClass().count);
  }
}
