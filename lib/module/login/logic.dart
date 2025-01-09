import 'package:get/get.dart';
import 'package:testinggapi/data/user_cache.dart';
import 'package:testinggapi/model/user_response/user_response.dart';
import 'package:testinggapi/route/app_page.dart';

import '../../data/api_service.dart';
import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  var userCache = Get.find<UserCache>();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    checkAuth();
  }

  Future<void> onLogin() async {
    var user = await userCache.getUser();
    try {
      final response = await APIService.instance.request(
        '/Authentication/login',
        DioMethod.post,
        param: {
          'userName': state.userContr.text,
          'password': state.passContr.text,
          'isactive': true,
          'role': "Customer",
        },
      );
      if (response.statusCode == 200) {
        print('API call successful: ${response.data}');
        final userResponse = UserResponse.fromJson(response.data);
        userCache.setUser(userResponse);
        if (user != null || user != UserResponse()) {
          Get.offNamed(AppRoute.HOME);
        }
      } else {
        print('API call failed: ${response.statusMessage}');
      }
    } catch (e) {
      print('Network error occurred: $e');
    }
  }

  Future<void> checkAuth() async {
    var user = await userCache.getUser();
    if ((user?.token ?? "").isNotEmpty || user?.token != null) {
      Get.offNamed(AppRoute.HOME);
      // Get.offNamed(AppRoute.LOGIN);
    } else {
      Get.offNamed(AppRoute.LOGIN);
    }
  }
}
