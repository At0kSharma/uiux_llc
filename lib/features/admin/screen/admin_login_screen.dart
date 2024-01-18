import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux/common/widget/form_label.dart';
import 'package:uiux/features/admin/controller/admin_login_controller.dart';
import 'package:uiux/features/admin/screen/widget/enter_password_text.dart';
import 'package:uiux/features/authentication/password/screen/widget/reset_password_btn.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  void initState() {
    super.initState();
    // Clear the text fields when the screen is loaded
    controller.email.text = 'team.uiux.llc@gmail.com';
    controller.password.text = '';
  }

  bool _obscureText = true;
  final controller = Get.put(AdminLoginController());
  final formKey = GlobalKey<FormState>();
  // final String userEmail = ''
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
              const EnterThePassText(),
              //imput label
              // const FormLabel(label: "Enter Your Email Here", leftPadding: 0),
              // const SizedBox(height: 12),

              // //email input field
              // TextFormField(
              //   controller: controller.email,
              //   decoration: InputDecoration(
              //     labelText: 'Email',
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(5),
              //       borderSide: const BorderSide(width: 0.3),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(5),
              //       borderSide: const BorderSide(width: 0.3),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 30),

              //password label
              const FormLabel(
                  label: "Enter Your Password Here", leftPadding: 0),
              const SizedBox(height: 12),

              //password input text field
              TextFormField(
                controller: controller.password,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
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
              const SizedBox(height: 0),

              //reset password button
              const ResetPasswordBtn(),

              //submit button
              ElevatedButton(
                onPressed: () {
                  AdminLoginController.instance.authenticateAdminUser(
                      controller.email.text.trim(),
                      controller.password.text.trim());
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
