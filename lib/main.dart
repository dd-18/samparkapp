import 'package:flutter/material.dart';
import 'package:samparkapp/Config/Theme.dart';
import 'Pages/SplashPage/SplashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sampark App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: SplashPage(),
    );
  }
}

