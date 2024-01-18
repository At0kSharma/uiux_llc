import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux/common/widget/form_label.dart';

import 'package:uiux/features/authentication/password/controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  void initState() {
    super.initState();
    // Clear the text fields when the screen is loaded
    controller.email.text = '';
    // controller.password.text = '';
  }

  // bool _obscureText = true;
  final controller = Get.put(ResetPasswordController());
  // final formKey = GlobalKey<FormState>();
  // final String userEmail = ''
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        backgroundColor: const Color(0xFF83A2FF),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //input label
              const FormLabel(label: "Enter Your Email Here", leftPadding: 0),
              const SizedBox(height: 12),

              //email input field
              TextFormField(
                controller: controller.email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(width: 0.3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(width: 0.3),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              //submit button
              ElevatedButton(
                onPressed: () {
                  ResetPasswordController.instance
                      .resetPassword(controller.email.text.trim());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: const Color(0xFF83A2FF),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text("SUBMIT"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
