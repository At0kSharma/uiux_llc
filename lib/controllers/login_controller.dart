import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux/controllers/authentication_controller.dart';
import 'package:uiux/controllers/user_controller.dart';
import 'package:uiux/models/user_model.dart';
import 'package:uiux/screens/verify_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final name = TextEditingController();

  final userRepo = Get.put(UserController());

  Future<void> createUser(UserModel user) async {
    phoneAuthentication(user.phoneNumber);
    await userRepo.createUser(user);
    Get.to(() => const VerifyScreen());
  }

  void phoneAuthentication(String phoneNumber) {
    AuthenticationController.instance.phoneAuthentication(phoneNumber);
  }
}
