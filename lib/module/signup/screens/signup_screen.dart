import 'package:flutter/material.dart';
import 'package:project_ebook/module/signup/components/body_signup.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodySignup(),
    );
  }
}
