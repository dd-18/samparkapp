import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samparkapp/Pages/ContactPage/Widgets/ContactSearch.dart';

import '../../Config/Images.dart';
import '../../Config/Strings.dart';
import '../../Controller/ChatController.dart';
import '../../Controller/ContactController.dart';
import '../../Controller/ProfileController.dart';
import '../Chat/ChatPage.dart';
import '../HomePage/Widgets/ChatTile.dart';
import 'Widgets/NewContactTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnabled = false.obs;
    ContactController contactController = Get.put(ContactController());
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());
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
          actions: [
            Obx(
              () => IconButton(
                onPressed: () {
                  isSearchEnabled.value = !isSearchEnabled.value;
                },
                icon: isSearchEnabled.value
                    ? Icon(Icons.close)
                    : Icon(Icons.search),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Obx(() => isSearchEnabled.value ? ContactSearch() : SizedBox()),
              SizedBox(height: 10),
              NewContactTile(
                btnName: "New Contact",
                icon: Icons.person_add_alt_1,
                onTap: () {},
              ),
              SizedBox(height: 10),
              NewContactTile(
                btnName: "New Group",
                icon: Icons.group_add_rounded,
                onTap: () {},
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Contact on ${WelcomePageStrings.appName}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                () => Column(
                  children: contactController.userList
                      .map(
                        (e) => InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.to(() => ChatPage(userModel: e));
                          },
                          child: ChatTile(
                            name: "${e.name}",
                            lastChat: e.about ?? "Hey Buddy, Ready to Chat",
                            lastTime:
                                e.email ==
                                    profileController.currentUser.value.email
                                ? "You"
                                : "",
                            imageUrl: e.profileImage ?? AssetsImage.boypic,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
