import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';

class DisignDivider extends StatelessWidget {
  const DisignDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
      ),
      width: size.width * 0.8,
      child: Row(
        children: [
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              'QR',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return const Expanded(
      child: Divider(
        color: kPrimaryDiver,
        //  height: 2.,
      ),
    );
  }
}
