import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/PrimaryButton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: Theme.of(context).textTheme.labelLarge,
            prefixIcon: Icon(
              Icons.alternate_email,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            fillColor: Theme.of(context).colorScheme.surface,
            filled: true,
            border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: Theme.of(context).textTheme.labelLarge,
            prefixIcon: Icon(
              Icons.password,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            fillColor: Theme.of(context).colorScheme.surface,
            filled: true,
            border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 60),
        PrimaryButton(btnName: "LOGIN", icon: Icons.lock_open_sharp , onTap: () {
          Get.offAllNamed("/homePage");
        }),
      ],
    );
  }
}
