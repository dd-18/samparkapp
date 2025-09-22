import 'package:flutter/material.dart';

import '../WelcomePage/Widgets/WelcomeHeading.dart';
import 'Widgets/AuthPageBody.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                WelcomeHeading(),
                SizedBox(height: 40),
                AuthPageBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
