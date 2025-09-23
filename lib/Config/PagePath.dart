import 'package:get/get.dart';

import '../Pages/Auth/AuthPage.dart';
import '../Pages/Chat/ChatPage.dart';
import '../Pages/HomePage/HomePage.dart';
import '../Pages/Profile/ProfilePage.dart';
import '../Pages/Profile/UpdateProfile.dart';

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
  GetPage(
    name: "/chatPage",
    page: () => ChatPage(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/profilePage",
    page: () => ProfilePage(),
    transition: Transition.rightToLeftWithFade,
  ),GetPage(
    name: "/updateProfilePage",
    page: () => UpdateProfile(),
    transition: Transition.rightToLeftWithFade,
  ),
];
