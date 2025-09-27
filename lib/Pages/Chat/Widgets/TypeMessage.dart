import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Controller/ChatController.dart';
import '../../../Controller/ImagePickerController.dart';
import '../../../Models/UserModel.dart';

class TypeMessage extends StatelessWidget {
  final UserModel userModel;
  const TypeMessage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    ChatController chatController = Get.put(ChatController());
    ImagePickerController imagePickerController = Get.put(
      ImagePickerController(),
    );
    RxString message = ''.obs;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                height: 37,
                width: 38,
                child: IconButton(
                  onPressed: () {
                  },
                  icon: Icon(
                    Icons.emoji_emotions_outlined,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  message.value = value;
                },
                controller: messageController,
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'Type a message',
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              height: 37,
              width: 38,
              child: IconButton(
                onPressed: () {
                  Get.bottomSheet(
                    SafeArea(
                      child: Container(
                        height: 120,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                String? pickedPath = await imagePickerController
                                    .pickImage(ImageSource.camera);
                                if (pickedPath != null &&
                                    pickedPath.isNotEmpty) {
                                  chatController.selectedImagePath.value =
                                      pickedPath;
                                }
                                Get.back();
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                                ),
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                Get.back();
                                String? pickedPath = await imagePickerController
                                    .pickImage(ImageSource.gallery);
                                if (pickedPath != null &&
                                    pickedPath.isNotEmpty) {
                                  chatController.selectedImagePath.value =
                                      pickedPath;
                                }
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                                ),
                                child: Icon(
                                  Icons.photo_library_rounded,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                                Get.snackbar(
                                  "Info",
                                  "Video selection not implemented yet.",
                                  backgroundColor: Colors.red,
                                );
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                                ),
                                child: Icon(
                                  Icons.video_collection_rounded,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                  );
                },
                icon: Icon(
                  Icons.attachment_rounded,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            SizedBox(width: 3),
            Obx(
              () =>
                  (message.value == "" &&
                      chatController.selectedImagePath.value == "")
                  ? Container(
                      height: 37,
                      width: 38,
                      child: IconButton(
                        onPressed: () {
                        },
                        icon: Icon(
                          Icons.mic_rounded,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    )
                  : Container(
                      height: 37,
                      width: 35,
                      child: IconButton(
                        onPressed: () {
                          String currentMessageText = messageController.text;
                          String currentSelectedImagePath =
                              chatController.selectedImagePath.value;

                          if (currentSelectedImagePath.isNotEmpty) {
                            chatController.sendImage(
                              userModel.id!,
                              currentSelectedImagePath,
                              userModel,
                              currentMessageText,
                            );
                          } else if (currentMessageText.isNotEmpty) {
                            chatController.sendMessage(
                              userModel.id!,
                              currentMessageText,
                              userModel,
                            );
                          }

                          if (currentSelectedImagePath.isNotEmpty ||
                              currentMessageText.isNotEmpty) {
                            chatController.selectedImagePath.value = "";
                            messageController.clear();
                            message.value = "";
                          }
                        },
                        icon: Icon(
                          Icons.send_rounded,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
