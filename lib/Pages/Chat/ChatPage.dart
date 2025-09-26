import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:samparkapp/Config/Images.dart';
import 'package:samparkapp/Models/UserModel.dart';

import '../../Controller/ChatController.dart';
import '../../Models/ChatModel.dart';
import 'Widgets/ChatBubbles.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Image.asset(AssetsImage.boypic),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.name ?? "User",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text('Online', style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10), // Keep padding for the ListView
                  child: StreamBuilder<List<ChatModel>>(
                    stream: chatController.getMessages(userModel.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
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
                              message: snapshot.data![index].message!,
                              isComing: true,
                              imageUrl: snapshot.data![index].imageUrl ?? '',
                              status: 'offline',
                              time: formattedTime,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
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
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.image_rounded,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    SizedBox(width: 3),
                    InkWell(
                      onTap: () {
                        if (messageController.text.isNotEmpty) {
                          chatController.sendMessage(
                            userModel.id!,
                            messageController.text,
                          );
                          messageController.clear();
                        }
                      },
                      child: Container(
                        height: 37,
                        width: 35,
                        child: IconButton(
                          onPressed: () {
                            if (messageController.text.isNotEmpty) {
                              chatController.sendMessage(
                                userModel.id!,
                                messageController.text,
                              );
                              messageController.clear();
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
            ],
          ),
        ),
      ),
    );
  }
}
