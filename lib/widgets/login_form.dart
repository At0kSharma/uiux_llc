import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:uiux/controllers/login_controller.dart';

import 'package:uiux/models/user_model.dart';
import 'package:uiux/widgets/form_label.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final controller = Get.put(LoginController());
  final formkey = GlobalKey<FormState>();
  var phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const FormLabel(label: "Enter Your Name Here"),
          const SizedBox(height: 10),
          SizedBox(
            width: 340.0,
            child: TextFormField(
              controller: controller.name,
              decoration: const InputDecoration(
                labelText: "Your Name",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(96, 87, 84, 84),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF849AD4),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const FormLabel(label: "Enter Your  Mobile Number Here"),
          const SizedBox(height: 10),
          SizedBox(
            width: 340,
            child: IntlPhoneField(
              // controller: controller.phoneNo,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(96, 87, 84, 84),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF849AD4),
                  ),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                phoneNumber = phone.completeNumber;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                final user = UserModel(
                    userName: controller.name.text.trim(),
                    phoneNumber: phoneNumber);
                LoginController.instance.createUser(user);
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(340, 60),
              backgroundColor: const Color(0xFF849AD4),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22.0,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
            child: const Text("SUBMIT"),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
