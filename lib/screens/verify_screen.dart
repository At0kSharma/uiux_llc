import 'package:flutter/material.dart';
import 'package:uiux/widgets/otp_verify_form.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String otp;
    return const Scaffold(
      body: Stack(
        children: [
          OtpVerifyForm(),
        ],
      ),
    );
  }
}
