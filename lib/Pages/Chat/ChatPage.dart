import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:samparkapp/Config/Images.dart';
import 'package:samparkapp/Models/UserModel.dart';
import 'package:samparkapp/Pages/Chat/Widgets/TypeMessage.dart';
import 'package:samparkapp/Pages/UserProfile/UserProfilePage.dart';

import '../../Controller/ChatController.dart';
import '../../Controller/ProfileController.dart';
import '../../Models/ChatModel.dart';
import 'Widgets/ChatBubbles.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Get.to(UserProfilePage(userModel: userModel));
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Image.asset(userModel.profileImage ?? AssetsImage.boypic),
            ),
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Get.to(UserProfilePage(userModel: userModel));
            },
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userModel.name ?? "User",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Online',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      StreamBuilder<List<ChatModel>>(
                        stream: chatController.getMessages(userModel.id!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('No messages yet.'));
                          } else {
                            return ListView.builder(
                              reverse: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                DateTime timestamp = DateTime.parse(
                                  snapshot.data![index].timestamp!,
                                );
                                String formattedTime = DateFormat(
                                  'hh:mm a',
                                ).format(timestamp);
                                return ChatBubbles(
                                  key: ValueKey(snapshot.data![index].id),
                                  message: snapshot.data![index].message!,
                                  isComing:
                                      snapshot.data![index].senderId !=
                                      profileController.currentUser.value.id,
                                  imageUrl:
                                      snapshot.data![index].imageUrl ?? '',
                                  status: 'offline',
                                  time: formattedTime,
                                );
                              },
                            );
                          }
                        },
                      ),
                      Obx(
                        () => (chatController.selectedImagePath.value != "")
                            ? Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 300,
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(
                                          chatController
                                              .selectedImagePath
                                              .value,
                                        ),
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: -5,
                                        right: -5,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.redAccent,
                                          ),
                                          onPressed: () {
                                            chatController
                                                    .selectedImagePath
                                                    .value =
                                                "";
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
                TypeMessage(userModel: userModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
