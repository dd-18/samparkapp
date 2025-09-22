import 'package:flutter/material.dart';
import 'package:samparkapp/Config/Images.dart';

import 'ChatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          name: "John Doe",
          lastChat: "Last Message Is Perfectly shown",
          lastTime: "10:00 AM",
          imageUrl: AssetsImage.boypic,
        ),
        ChatTile(
          name: "John Doe",
          lastChat: "Last Message Is Perfectly shown",
          lastTime: "10:00 AM",
          imageUrl: AssetsImage.girlpic,
        ),
        ChatTile(
          name: "John Doe",
          lastChat: "Last Message Is Perfectly shown",
          lastTime: "10:00 AM",
          imageUrl: AssetsImage.boypic,
        ),
        ChatTile(
          name: "John Doe",
          lastChat: "Last Message Is Perfectly shown",
          lastTime: "10:00 AM",
          imageUrl: AssetsImage.girlpic,
        ),
      ],
    );
  }
}
