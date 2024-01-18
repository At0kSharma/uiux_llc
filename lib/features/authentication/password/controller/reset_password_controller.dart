import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux/features/authentication/admin/controller/admin_controller.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance => Get.find();
  final email = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final adminRepo = Get.put(AdminController());
  resetPassword(String email) async {
    await AdminController.instance.resetUserPassword(email);
  }
  // authenticateAdminUser(String email, String password) async {
  //   await AdminController.instance.verifyPassword(email, password)
  //       ? Get.offAll(() => const DashboardScreen())
  //       : Get.snackbar("Error", "You are not Authorized");
  // }
  // authenticateAdminUser(String email, String password) async {
  //   await AdminController.instance.createOrUpdateUser(email, password);
  // }
}
