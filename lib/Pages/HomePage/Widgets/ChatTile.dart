import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Config/Images.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String lastChat;
  final String lastTime;
  final String imageUrl;

  const ChatTile({
    super.key,
    required this.name,
    required this.lastChat,
    required this.lastTime,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/chatPage");
      },
      child: Container(
        height: 70,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imageUrl, width: 50),
              SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(height: 5),
                  Text(
                    lastChat,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              Spacer(),
              Text(lastTime, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
      ),
    );
  }
}
