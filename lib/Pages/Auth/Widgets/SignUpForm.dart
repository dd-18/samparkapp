import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/AuthController.dart';
import '../../../Widgets/PrimaryButton.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: "Name",
            hintStyle: Theme.of(context).textTheme.labelLarge,
            prefixIcon: Icon(
              Icons.person,
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
                  btnName: "SIGNUP",
                  icon: Icons.person,
                  onTap: () {
                    if (password.text.isEmpty || password.text.length < 6) {
                      Get.snackbar('Error', 'Password must be at least 6 characters long');
                      return;
                    }
                    authController.createUser(
                      email.text, // Corrected order
                      password.text,
                      name.text,  // Corrected order
                    );
                  },
                ),
        ),
      ],
    );
  }
}
