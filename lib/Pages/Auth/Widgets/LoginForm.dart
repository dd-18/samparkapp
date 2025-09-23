import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/AuthController.dart';
import '../../../Widgets/PrimaryButton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: Theme.of(context).textTheme.labelLarge,
            prefixIcon: Icon(
              Icons.alternate_email,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            fillColor: Theme.of(context).colorScheme.surface,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: password,
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: Theme.of(context).textTheme.labelLarge,
            prefixIcon: Icon(
              Icons.password,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            fillColor: Theme.of(context).colorScheme.surface,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 60),
        Obx(
          () => authController.isLoading.value == true
              ? CircularProgressIndicator()
              : PrimaryButton(
                  btnName: "LOGIN",
                  icon: Icons.lock_open_sharp,
                  onTap: () {
                    authController.login(email.text, password.text);
                    // Get.offAllNamed("/homePage");
                  },
                ),
        ),
      ],
    );
  }
}
