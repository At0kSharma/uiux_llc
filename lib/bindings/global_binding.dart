import 'package:get/get.dart';

import 'package:uiux/features/authentication/authentication_controller.dart';
import 'package:uiux/features/authentication/user/controller/user_controller.dart';
import 'package:uiux/features/home/controller/update_otp_status.dart';
import 'package:uiux/features/login/controller/login_controller.dart';

import 'package:uiux/features/verify/controller/verify_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<UpdateOTPController>(UpdateOTPController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<VerifyController>(VerifyController(), permanent: true);
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<AuthenticationController>(AuthenticationController(),
        permanent: true);
  }
}
