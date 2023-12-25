import 'package:get/get.dart';
import 'package:uiux/controllers/authentication_controller.dart';
import 'package:uiux/screens/home_scree.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  Future<void> verifyOTP(String otp) async {
    var isVerified = await AuthenticationController.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const HomeScreen()) : Get.back();
  }
}
