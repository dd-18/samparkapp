import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("data"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle button press
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
