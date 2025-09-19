import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SAMPARK APP",style: Theme.of(context).textTheme.headlineSmall,),
        centerTitle: true,
      ),

    );
  }
}
