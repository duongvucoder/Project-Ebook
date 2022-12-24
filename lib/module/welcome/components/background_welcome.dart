import 'package:flutter/material.dart';

class BackgroundWelcome extends StatelessWidget {
  final Widget childWelcome;
  const BackgroundWelcome({
    Key? key,
    required this.childWelcome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            width: size.width * 0.3,
            child: Image.asset('assets/images/main_top.png'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            width: size.width * 0.2,
            child: Image.asset('assets/images/main_bottom.png'),
          ),
          childWelcome,
        ],
      ),
    );
  }
}
