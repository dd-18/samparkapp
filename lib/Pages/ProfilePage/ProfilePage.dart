import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AuthController.dart';
import '../../Controller/ImagePickerController.dart';
import '../../Controller/ProfileController.dart';
import '../../Widgets/PrimaryButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());
    ImagePickerController imagePickerController = Get.put(
      ImagePickerController(),
    );
    // Changed initialization for nullable reactive String
    final imagePath = Rxn<String>();

    TextEditingController name = TextEditingController(
      text: profileController.currentUser.value.name,
    );
    TextEditingController email = TextEditingController(
      text: profileController.currentUser.value.email,
    );
    TextEditingController phone = TextEditingController(
      text: profileController.currentUser.value.phoneNumber,
    );
    TextEditingController about = TextEditingController(
      text: profileController.currentUser.value.about,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          actions: [
            IconButton(
              onPressed: () {
                authController.logoutUser();
              },
              icon: Icon(Icons.logout_rounded),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => isEdit.value
                                    ? InkWell(
                                        onTap: () async {
                                          // Assign directly to Rxn<String>.value
                                          imagePath.value =
                                              await imagePickerController
                                                  .pickImage();
                                        },
                                        child: CircleAvatar(
                                          radius: 80,
                                          backgroundColor: Theme.of(
                                            context,
                                          ).colorScheme.surface,
                                          child:
                                              imagePath.value != null &&
                                                  imagePath.value!.isNotEmpty
                                              ? ClipOval(
                                                  child: Image.file(
                                                    File(imagePath.value!),
                                                    fit: BoxFit.cover,
                                                    width: 160,
                                                    height: 160,
                                                  ),
                                                )
                                              : Icon(Icons.add, size: 40),
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 80,
                                        backgroundColor: Theme.of(
                                          context,
                                        ).colorScheme.surface,
                                        child:
                                            profileController
                                                        .currentUser
                                                        .value
                                                        .profileImage !=
                                                    null &&
                                                profileController
                                                    .currentUser
                                                    .value
                                                    .profileImage!
                                                    .isNotEmpty
                                            ? ClipOval(
                                                child: Image.network(
                                                  profileController
                                                      .currentUser
                                                      .value
                                                      .profileImage!,
                                                  fit: BoxFit.cover,
                                                  width: 160,
                                                  height: 160,
                                                  errorBuilder:
                                                      (
                                                        context,
                                                        error,
                                                        stackTrace,
                                                      ) => Icon(
                                                        Icons.image_rounded,
                                                        size: 40,
                                                      ),
                                                ),
                                              )
                                            : Icon(
                                                Icons.image_rounded,
                                                size: 40,
                                              ),
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => TextField(
                              controller: name,
                              enabled: isEdit.value,
                              decoration: InputDecoration(
                                labelText: "Name",
                                filled: isEdit.value,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => TextField(
                              controller: about,
                              enabled: isEdit.value,
                              decoration: InputDecoration(
                                labelText: "About",
                                filled: isEdit.value,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: Icon(Icons.info),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: email,
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: "Email",
                              filled: isEdit.value,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: Icon(Icons.alternate_email),
                            ),
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => TextField(
                              controller: phone,
                              enabled: isEdit.value,
                              decoration: InputDecoration(
                                labelText: "Phone Number",
                                filled: isEdit.value,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: Icon(Icons.call),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => isEdit.value
                                    ? PrimaryButton(
                                        btnName: "Save",
                                        icon: Icons.save,
                                        onTap: () async {
                                          await profileController.updateProfile(
                                            name.text,
                                            phone.text,
                                            about.text,
                                          );
                                          isEdit.value = false;
                                        },
                                      )
                                    : PrimaryButton(
                                        btnName: "Edit",
                                        icon: Icons.edit,
                                        onTap: () {
                                          isEdit.value = true;
                                        },
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
