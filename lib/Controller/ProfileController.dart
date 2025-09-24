import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:samparkapp/Models/UserModel.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  Rx<UserModel> currentUser = UserModel().obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    // Consider adding isLoading here if it's a long operation or called frequently
    // isLoading.value = true;
    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) {
        if (value.exists && value.data() != null) {
          currentUser.value = UserModel.fromJson(value.data()!);
        } else {
          // Handle case where user document doesn't exist or data is null
          print("User document does not exist or is empty.");
          // You might want to set currentUser to a default or show an error
        }
      });
    } catch (e) {
      print("Error fetching user details: $e");
      // Handle error, maybe show a snackbar
    } finally {
      // isLoading.value = false;
    }
  }

  Future<void> updateProfile(
    String name,
    String phoneNumber,
    String about,
  ) async {
    isLoading.value = true;
    try {
      String userId = auth.currentUser!.uid;
      Map<String, dynamic> dataToUpdate = {
        'name': name,
        'phoneNumber': phoneNumber,
        'about': about,
      };

      await db
          .collection("users")
          .doc(userId)
          .set(dataToUpdate, SetOptions(merge: true)); // Use merge: true

      // Update local state to reflect changes
      currentUser.update((user) {
        if (user != null) {
          user.name = name;
          user.phoneNumber = phoneNumber;
          user.about = about;
        }
      });

      Get.snackbar(
        "Profile Updated",
        "Your profile has been updated successfully.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print("Error updating profile: $e");
      Get.snackbar(
        "Update Failed",
        "Could not update profile. Error: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
