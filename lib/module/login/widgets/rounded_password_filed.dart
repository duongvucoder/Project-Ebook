import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/login/widgets/tex_field_container.dart';

class RoundedPassWordField extends StatefulWidget {
  final Function onChanged;
  const RoundedPassWordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPassWordField> createState() => _RoundedPassWordFieldState();
}

class _RoundedPassWordFieldState extends State<RoundedPassWordField> {
  final TextEditingController _passwordController = TextEditingController();
  bool _passInvalid = false;
  bool _isShowPassWord = true;
  var _passErr = 'Mat khau khong hop le';
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: _passwordController,
        onChanged: ((value) {
          onSignInClick();
        }),
        obscureText: _isShowPassWord,
        decoration: InputDecoration(
          errorText: _passInvalid ? _passErr : null,
          hintText: 'Mật khẩu',
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _isShowPassWord = !_isShowPassWord;
              });
            },
            child: const Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  void onSignInClick() {
    setState(() {
      if (_passwordController.text.length < 6 ||
          !_passwordController.text.contains('@')) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }
    });
  }
}
