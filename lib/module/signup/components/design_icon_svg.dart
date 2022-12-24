import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_ebook/common/const.dart';

class DesignIconSVG extends StatelessWidget {
  final String iconSVG;
  final Function onPress;
  const DesignIconSVG({
    Key? key,
    required this.iconSVG,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSVG,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
