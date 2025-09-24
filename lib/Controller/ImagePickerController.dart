import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final ImagePicker picker = ImagePicker();

  Future<String?> pickImage() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        return image.path;
      } else {
        print("ImagePickerController: User cancelled image picking.");
        return null;
      }
    } catch (e) {
      print("ImagePickerController: Error picking image: $e");
      return null;
    }
  }
}
