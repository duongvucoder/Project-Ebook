import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/login/widgets/tex_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  final TextEditingController? controller;
  final TextInputType keyboardType;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
