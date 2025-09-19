import 'package:get/get.dart';

import '../Pages/Auth/AuthPage.dart';

var pagePath = [
  GetPage(
      name: "/authPage",
      page: () => AuthPage(),
      transition: Transition.rightToLeftWithFade,
  )
];
