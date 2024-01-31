import 'package:get/get.dart';

class changeTheme extends GetxController {
  RxBool theme = false.obs;

  changeThemeLightAndDark() {
    theme.value = !theme.value;
  }
}
