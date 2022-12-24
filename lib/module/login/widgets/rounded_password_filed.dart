import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/login/widgets/tex_field_container.dart';

class RoundedPassWordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPassWordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPassWordField> createState() => _RoundedPassWordFieldState();
}

class _RoundedPassWordFieldState extends State<RoundedPassWordField> {
  final TextEditingController _passwordController = TextEditingController();

  bool _isShowPassWord = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: _passwordController,
        onChanged: widget.onChanged,
        obscureText: _isShowPassWord,
        decoration: InputDecoration(
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
}
