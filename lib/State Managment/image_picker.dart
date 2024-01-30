import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class imagePickerController extends GetxController {
  RxString imgPath = "".obs;

  Future imagePick() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imgPath.value = image.path.toString();
    }
  }
}
