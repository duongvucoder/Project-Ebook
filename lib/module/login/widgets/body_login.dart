import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_ebook/effect/transition/keyboard.dart';
import 'package:project_ebook/module/homepage/homepage_ebook.dart';
import 'package:project_ebook/module/login/widgets/already_have_an_account_check.dart';
import 'package:project_ebook/module/login/widgets/background_login.dart';
import 'package:project_ebook/module/login/widgets/rounded_input_field.dart';
import 'package:project_ebook/module/login/widgets/rounded_password_filed.dart';
import 'package:project_ebook/module/signup/screens/signup_screen.dart';
import 'package:project_ebook/module/welcome/components/rounded_buttom.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        hideKeyboardAndUnFocus(context);
      },
      child: BackgroundLogin(
        childLogin: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Đăng Nhập',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                'assets/icons/login.svg',
                height: size.height * 0.35,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedInputField(
                hintText: 'Nhập tài khoản',
                onChanged: ((value) {}),
              ),
              RoundedPassWordField(
                onChanged: (value) {},
              ),
              RoundedButtom(
                text: 'Đăng Nhập',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                onpress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
