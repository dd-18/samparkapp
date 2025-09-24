import 'package:flutter/material.dart';

import '../../Widgets/PrimaryButton.dart';

class UserUpdateProfile extends StatelessWidget {
  const UserUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Profile")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            width: 200,
                            height: 200,
                            child: Center(
                              child: Icon(Icons.image_rounded, size: 30),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Personal Info",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Name",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Theme.of(context).colorScheme.surface,
                              filled: true,
                              hintText: "Steve Jobs",
                              hintStyle: Theme.of(context).textTheme.labelLarge,
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Email ID",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Theme.of(context).colorScheme.surface,
                              filled: true,
                              hintText: "sjobs@gmail.com",
                              hintStyle: Theme.of(context).textTheme.labelLarge,
                              prefixIcon: Icon(Icons.alternate_email),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Phone Number",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              fillColor: Theme.of(context).colorScheme.surface,
                              filled: true,
                              hintText: "9876543210",
                              hintStyle: Theme.of(context).textTheme.labelLarge,
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryButton(btnName: "Save", icon: Icons.save),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
