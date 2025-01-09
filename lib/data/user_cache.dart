import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testinggapi/model/user_response/user_response.dart';
import 'package:testinggapi/module/login/logic.dart';

class UserCache {
  Future<Box<UserResponse>> getBox() async {
    if (!Hive.isBoxOpen("user_box")) {
      return await Hive.openBox<UserResponse>("user_box");
    }
    return Hive.box<UserResponse>("user_box");
  }

  Future<UserResponse?> getUser() async {
    Box<UserResponse> box = await getBox();
    if (!box.isOpen) {
      return null;
    }
    // Attempt to retrieve the cashier info
    UserResponse? data = box.get("user_data");
    // If data is null, set a default value
    if (data == null) {
      UserResponse defaultData = UserResponse();
      await setUser(defaultData);
      data = box.get("user_data");
    }
    Get.find<LoginLogic>().state.user.value = data ?? UserResponse();
    return data;
  }

  Future<void> setUser(UserResponse user) async {
    Box box = await getBox();
    if (box.isOpen == false) {
      return;
    }
    box.put("user_data", user);
  }
}
