import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Config/Images.dart';

class ChatBubbles extends StatelessWidget {
  final String message;
  final bool isComing;
  final String status;
  final String time;
  final String imageUrl;
  const ChatBubbles({
    super.key,
    required this.message,
    required this.isComing,
    required this.status,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: isComing
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width / 1.3,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: isComing ? BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(10),
              ) : BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: imageUrl == ""
                ? Text(message)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                          child: Image.network(imageUrl)),
                      SizedBox(height: 5),
                      Text(message),
                    ],
                  ),
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: isComing
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              isComing
                  ? Text(time, style: Theme.of(context).textTheme.labelSmall)
                  : Row(
                      children: [
                        Text(
                          time,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        SizedBox(width: 5),
                        SvgPicture.asset(AssetsImage.chatStatusSVG),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
