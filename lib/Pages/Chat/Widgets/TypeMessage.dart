import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                  onPressed: () {},
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
            InkWell(
              onTap: () async {
                chatController.selectedImagePath.value =
                    (await imagePickerController.pickImage())!;
                messageController.clear();
              },
              child: Container(
                height: 37,
                width: 38,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.image_rounded,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            SizedBox(width: 3),
            Obx(
              () => message.value == ""
                  ? Container(
                      height: 37,
                      width: 38,
                      child: IconButton(
                        onPressed: () {},
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
                          if (messageController.text.isNotEmpty) {
                            chatController.sendMessage(
                              userModel.id!,
                              messageController.text,
                              userModel,
                            );
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
