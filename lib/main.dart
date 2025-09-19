import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samparkapp/Config/PagePath.dart';
import 'package:samparkapp/Config/Theme.dart';
import 'package:samparkapp/Pages/WelcomePage/WelcomePage.dart';
import 'Pages/SplashPage/SplashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sampark App',
      getPages: pagePath,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: WelcomePage(),
    );
  }
}

