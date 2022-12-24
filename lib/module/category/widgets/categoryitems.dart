import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final double? titleSize;
  final String? image;
  final String? category;
  final Color color;
  final align;
  const CategoryItems({
    Key? key,
    this.height,
    this.width,
    this.radius = 8,
    this.titleSize,
    this.image,
    this.category,
    this.color = Colors.grey,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              // color: Colors.yellow,
              image: DecorationImage(
                image: AssetImage(image ?? ''),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(color, BlendMode.difference),
              ),
            ),
          ),
          Align(
            alignment: align,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: category,
                    style: TextStyle(
                        fontSize: titleSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
