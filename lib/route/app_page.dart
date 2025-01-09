import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:testinggapi/module/home/binding.dart';
import 'package:testinggapi/module/home/view.dart';

import '../module/login/binding.dart';
import '../module/login/view.dart';

class AppRoute {
  static const HOME = "/home";
  static const LOGIN = "/";
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoute.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoute.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
