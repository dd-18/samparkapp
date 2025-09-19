import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samparkapp/Pages/WelcomePage/Widgets/WelcomeFooterButton.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../Config/Images.dart';
import '../../Config/Strings.dart';
import 'Widgets/WelcomeBody.dart';
import 'Widgets/WelcomeHeading.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [WelcomeHeading(), WelcomeBody(), WelcomeFooterButton()],
          ),
        ),
      ),
    );
  }
}
