import 'package:flutter/material.dart';
import 'package:samparkapp/Pages/HomePage/Widgets/ChatTile.dart';

import '../../Config/Images.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          name: 'Group Name',
          lastChat: 'Last Message',
          lastTime: '10.00 AM',
          imageUrl: AssetsImage.boypic,
        ),
      ],
    );
  }
}
