import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/login/screens/login_screen.dart';
import 'package:project_ebook/module/signup/screens/signup_screen.dart';
import 'package:project_ebook/module/welcome/components/background_welcome.dart';
import 'package:project_ebook/module/welcome/components/rounded_buttom.dart';

class BodyWelcome extends StatelessWidget {
  const BodyWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: BackgroundWelcome(
        childWelcome: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'CHÀO MỪNG BẠN ĐẾN VỚI EBOOK',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButtom(
              text: 'ĐĂNG NHẬP',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const LoginScreen()),
                  ),
                );
              },
            ),
            RoundedButtom(
              color: kPrimaryLightColor,
              textColor: Colors.black,
              text: 'ĐĂNG KÝ',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
