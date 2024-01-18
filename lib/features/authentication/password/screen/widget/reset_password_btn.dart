import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux/features/authentication/password/screen/reset_password_screen.dart';

class ResetPasswordBtn extends StatelessWidget {
  const ResetPasswordBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: () => Get.to(() => const ResetPasswordScreen()),
        child: const Text(
          "Forget Password",
          style: TextStyle(color: Color(0xFF83A2FF)),
        ),
      ),
    );
  }
}
