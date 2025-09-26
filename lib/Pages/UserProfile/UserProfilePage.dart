import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AuthController.dart';

import '../../Controller/ProfileController.dart';
import '../../Models/UserModel.dart';
import 'Widgets/UserInfo.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed("/updateProfilePage");
              },
              icon: Icon(Icons.edit),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              UserInfo(
                profileImage: userModel.profileImage ?? "",
                userName: userModel.name ?? "User",
                userEmail: userModel.email ?? "",
                phoneNumber: userModel.phoneNumber ?? "",
                about: userModel.about ?? "",
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  authController.logoutUser();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Logout", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
