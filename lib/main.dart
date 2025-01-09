import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testinggapi/model/user_response/user_response.dart';
import 'package:testinggapi/module/home/view.dart';
import 'package:testinggapi/route/app_page.dart';

import 'data/user_cache.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserResponseImplAdapter());
  await Hive.openBox('userBox');
  Get.put(UserCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.LOGIN,
      getPages: AppPages.pages,
      // home: HomePage(),
    );
  }
}
