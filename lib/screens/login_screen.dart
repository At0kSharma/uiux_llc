import 'package:flutter/material.dart';
import 'package:uiux/widgets/login_form.dart';
import 'package:uiux/widgets/offer_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const OfferText(),
          LoginForm(),
        ],
      ),
    );
  }
}
