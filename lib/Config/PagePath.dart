import 'package:get/get.dart';
import 'package:samparkapp/Pages/ContactPage/ContactPage.dart';

import '../Pages/Auth/AuthPage.dart';
import '../Pages/Chat/ChatPage.dart';
import '../Pages/HomePage/HomePage.dart';
import '../Pages/UserProfile/UserProfilePage.dart';
import '../Pages/UserProfile/UserUpdateProfile.dart';

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
    page: () => UserProfilePage(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/updateProfilePage",
    page: () => UserUpdateProfile(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/contactPage",
    page: () => ContactPage(),
    transition: Transition.rightToLeftWithFade,
  ),
];
