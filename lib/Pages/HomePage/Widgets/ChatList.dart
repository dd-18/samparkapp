import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samparkapp/Config/Images.dart';
import 'package:samparkapp/Models/ChatRoomModel.dart'; // Added for type safety
import 'package:samparkapp/Models/UserModel.dart'; // Added for ChatPage navigation
import 'package:samparkapp/Pages/Chat/ChatPage.dart'; // Added for navigation

import '../../../Controller/ContactController.dart';
import '../../../Controller/ProfileController.dart';
import 'ChatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());
    return RefreshIndicator(
      onRefresh: () async {
        await contactController.getChatRoomList();
      },
      child: Obx(
        () => ListView(
          children: contactController.chatRoomList
              .map(
                (e) => InkWell(
                  onTap: () {
                    Get.to(
                      () => ChatPage(
                        userModel:
                            (e.receiver!.id ==
                                profileController.currentUser.value.id
                            ? e.sender!
                            : e.receiver)!,
                      ),
                    );
                  },
                  child: ChatTile(
                    name:
                        (e.receiver!.id ==
                            profileController.currentUser.value.id
                        ? e.sender!.name
                        : e.receiver!.name)!,
                    lastChat: e.lastMessage!,
                    lastTime: e.lastMessageTimestamp!,
                    imageUrl:
                        (e.receiver!.id ==
                                profileController.currentUser.value.id
                            ? e.sender!.profileImage
                            : e.receiver!.profileImage) ??
                        AssetsImage.boypic,
                  ),
                ),
              )
              .toList(), // .toList() is good practice for children of ListView
        ),
      ),
    );
  }
}
