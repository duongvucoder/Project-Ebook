import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';

class RoundedButtom extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color;
  final Color textColor;

  const RoundedButtom({
    Key? key,
    required this.text,
    required this.onPress,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      alignment: Alignment.center,
      // width: size.width * 0.8,
      height: size.height * 0.06,

      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onPress();
        },
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void onSingInClicked() {}
}
