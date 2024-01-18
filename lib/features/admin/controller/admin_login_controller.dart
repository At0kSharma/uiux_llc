import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux/features/authentication/admin/controller/admin_controller.dart';

class AdminLoginController extends GetxController {
  static AdminLoginController get instance => Get.find();
  final password = TextEditingController();
  final email = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final adminRepo = Get.put(AdminController());
  // authenticateAdminUser(String email, String password) async {
  //   await AdminController.instance
  //       .createUserWithEmailAndPassword(email, password);
  // }
  authenticateAdminUser(String email, String password) async {
    await AdminController.instance.signInWithEmailAndPassword(email, password);
  }

  logOutUser() async {
    await AdminController.instance.signOutUser();
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
