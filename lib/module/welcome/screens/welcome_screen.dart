import 'package:flutter/material.dart';
import 'package:project_ebook/module/welcome/components/body_welcome.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyWelcome(),
    );
  }
}
