import 'package:flutter/material.dart';
import 'package:samparkapp/Config/Images.dart';

import 'Widgets/ChatBubbles.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text('Flutter Dev', style: Theme.of(context).textTheme.bodyLarge),
              Text('Online', style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
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
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
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
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(width: 3),
              Container(
                height: 37,
                width: 35,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send_rounded,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                ChatBubbles(
                  message: "Hello, How Are You?",
                  isComing: true,
                  imageUrl: '',
                  status: 'offline',
                  time: '10.10 AM',
                ),
                ChatBubbles(
                  message: "I am fine",
                  isComing: false,
                  imageUrl: '',
                  status: 'offline',
                  time: '10.10 AM',
                ),
                ChatBubbles(
                  message: "What about you?",
                  isComing: false,
                  imageUrl:
                      'https://blog.logrocket.com/wp-content/uploads/2022/09/32-free-flutter-templates-great-mobile-apps.png',
                  status: 'offline',
                  time: '10.10 AM',
                ),
                ChatBubbles(
                  message: "What about you?",
                  isComing: true,
                  imageUrl:
                      'https://blog.logrocket.com/wp-content/uploads/2022/09/32-free-flutter-templates-great-mobile-apps.png',
                  status: 'offline',
                  time: '10.10 AM',
                ),
                ChatBubbles(
                  message: "What about you?",
                  isComing: false,
                  imageUrl:
                      'https://blog.logrocket.com/wp-content/uploads/2022/09/32-free-flutter-templates-great-mobile-apps.png',
                  status: 'offline',
                  time: '10.10 AM',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
