import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testinggapi/model/user_response/user_response.dart';

class LoginState {
  TextEditingController userContr = TextEditingController();
  TextEditingController passContr = TextEditingController();
  var user = UserResponse().obs;
}
