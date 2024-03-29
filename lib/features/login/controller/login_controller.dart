import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux/features/authentication/authentication_controller.dart';
import 'package:uiux/features/authentication/user/controller/user_controller.dart';
import 'package:uiux/features/authentication/user/model/user_model.dart';
import 'package:uiux/features/verify/screen/verify_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final name = TextEditingController();

  final userRepo = Get.put(UserController());

  Future<void> createUser(UserModel user) async {
    phoneAuthentication(user.phoneNumber);
    if (await userRepo.doesUserExist(user.phoneNumber)) {
      // print("user exists redirecting to next page");
      Get.to(() => const VerifyScreen());
    } else {
      // print("user does not exists creating new user");
      await userRepo.createUser(user);
      Get.to(() => const VerifyScreen());
    }
  }

  void phoneAuthentication(String phoneNumber) {
    AuthenticationController.instance.phoneAuthentication(phoneNumber);
  }
}
