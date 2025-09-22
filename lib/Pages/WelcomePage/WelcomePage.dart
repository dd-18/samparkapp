import 'package:flutter/material.dart';
import 'package:samparkapp/Pages/WelcomePage/Widgets/WelcomeFooterButton.dart';
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
