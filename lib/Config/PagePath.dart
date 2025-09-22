import 'package:get/get.dart';

import '../Pages/Auth/AuthPage.dart';
import '../Pages/HomePage/HomePage.dart';

var pagePath = [
  GetPage(
      name: "/authPage",
      page: () => AuthPage(),
      transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/homePage",
    page: () => HomePage(),
    transition: Transition.rightToLeftWithFade,
  ),
];
