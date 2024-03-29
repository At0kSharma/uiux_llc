import 'package:flutter/material.dart';
import 'package:uiux/features/login/screen/widget/login_form.dart';
import 'package:uiux/features/login/screen/widget/offer_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const OfferText(),
              LoginForm(),
            ],
          ),
          // const AdminLoginBtn(),
        ],
      ),
    );
  }
}
