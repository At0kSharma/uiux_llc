import 'package:get/get.dart';
import 'package:uiux/controllers/authentication_controller.dart';
import 'package:uiux/controllers/login_controller.dart';
import 'package:uiux/controllers/otp_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<OTPController>(OTPController(), permanent: true);
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<AuthenticationController>(AuthenticationController(),
        permanent: true);
  }
}
