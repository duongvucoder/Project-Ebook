import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_ebook/effect/transition/keyboard.dart';
import 'package:project_ebook/module/login/widgets/already_have_an_account_check.dart';
import 'package:project_ebook/module/login/widgets/rounded_input_field.dart';
import 'package:project_ebook/module/login/widgets/rounded_password_filed.dart';
import 'package:project_ebook/module/login/screens/login_screen.dart';
import 'package:project_ebook/module/signup/components/background_signup.dart';
import 'package:project_ebook/module/signup/components/design_icon_svg.dart';
import 'package:project_ebook/module/signup/components/design_divider.dart';
import 'package:project_ebook/module/welcome/components/rounded_buttom.dart';

class BodySignup extends StatefulWidget {
  const BodySignup({super.key});

  @override
  State<BodySignup> createState() => _BodySignupState();
}

class _BodySignupState extends State<BodySignup> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  var notifier = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundSignup(
      childSignup: GestureDetector(
        onTap: () {
          hideKeyboardAndUnFocus(context);
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ĐĂNG KÝ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                'assets/icons/signup.svg',
                height: size.height * 0.2,
              ),
              RoundedInputField(
                controller: nameController,
                keyboardType: TextInputType.text,
                hintText: 'Tên',
              ),
              RoundedInputField(
                controller: phoneController,
                hintText: 'Số điện thoại',
                icon: Icons.contact_phone_sharp,
                keyboardType: TextInputType.number,
              ),
              RoundedInputField(
                controller: emailController,
                hintText: 'Email',
                icon: Icons.mail_sharp,
                keyboardType: TextInputType.text,
              ),
              RoundedPassWordField(
                onChanged: (value) {},
              ),
              RoundedButtom(
                text: 'ĐĂNG KÝ',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                login: false,
                onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
              const DisignDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DesignIconSVG(
                    iconSVG: 'assets/icons/facebook.svg',
                    onPress: () {},
                  ),
                  DesignIconSVG(
                    iconSVG: 'assets/icons/twitter.svg',
                    onPress: () {},
                  ),
                  DesignIconSVG(
                    iconSVG: 'assets/icons/google-plus.svg',
                    onPress: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
