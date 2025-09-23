import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:samparkapp/Pages/HomePage/Widgets/ChatList.dart';
import 'package:samparkapp/Pages/HomePage/Widgets/TabBar.dart';

import '../../Config/Images.dart';
import '../../Config/Strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: Text(
            AppStrings.appName,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: SvgPicture.asset(AssetsImage.appIconSVG),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
              onPressed: () {
                Get.toNamed("/profilePage");
              },
              icon: Icon(Icons.more_vert_rounded),
            ),
          ],
          bottom: myTabBar(tabController, context),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {},
          child: Icon(
            Icons.message_outlined,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TabBarView(
            controller: tabController,
            children: [
              ChatList(),
              ListView(children: [ListTile(title: Text("data"))]),
              ListView(children: [ListTile(title: Text("data"))]),
            ],
          ),
        ),
      ),
    );
  }
}
