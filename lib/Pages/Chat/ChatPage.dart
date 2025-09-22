import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        title: Column(
          children: [
            Text('Flutter Dev',style: Theme.of(context).textTheme.bodyLarge),
            Text('Online', style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
      body: SafeArea(child: Column()),
    );
  }
}
