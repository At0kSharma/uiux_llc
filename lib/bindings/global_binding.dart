import 'package:get/get.dart';
import 'package:uiux/features/admin/controller/admin_login_controller.dart';
import 'package:uiux/features/authentication/authentication_controller.dart';
import 'package:uiux/features/userlist/controller/csv_controller.dart';
import 'package:uiux/features/userlist/controller/pdf_controller.dart';
import 'package:uiux/features/userlist/controller/user_list_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AdminLoginController>(AdminLoginController(), permanent: true);
    Get.put<PdfController>(PdfController(), permanent: true);
    Get.put<CsvController>(CsvController(), permanent: true);
    Get.put<UserListController>(UserListController(), permanent: true);
    Get.put<AuthenticationController>(AuthenticationController(),
        permanent: true);
  }
}
