import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function onpress;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Tạo tài khoản?' : 'Đã tạo tài khoản ?',
          style: const TextStyle(
            color: kPrimaryColor,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (() {
            onpress();
          }),
          child: Text(
            login ? 'Đăng ký tài khoản' : 'Đăng nhập tài khoản',
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
