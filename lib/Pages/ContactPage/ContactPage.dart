import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Config/Images.dart';
import '../HomePage/Widgets/ChatTile.dart';
import 'Widgets/NewContactTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Select contact"),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              NewContactTile(
                btnName: "New Contact",
                icon: Icons.person_add_alt_1,
                onTap: () {},
              ),
              NewContactTile(
                btnName: "New Group",
                icon: Icons.group_add_rounded,
                onTap: () {},
              ),
              SizedBox(height: 20),
              Row(children: [Text("Contact on Sampark")]),
              SizedBox(height: 20),
              Column(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
