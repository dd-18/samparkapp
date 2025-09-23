import 'package:flutter/material.dart';

import '../../../Widgets/PrimaryButton.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Name",
            hintStyle: Theme.of(context).textTheme.labelLarge,
            prefixIcon: Icon(
              Icons.person,
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
        PrimaryButton(btnName: "SIGNUP",icon: Icons.person,),
      ],
    );
  }
}
