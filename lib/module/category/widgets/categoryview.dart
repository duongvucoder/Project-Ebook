import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  final int column, items;
  final Widget? child;
  final Color color;
  final double ratio;
  final double? height, width;
  final direction, itemBuilder;

  const CategoryView({
    Key? key,
    this.column = 2,
    this.items = 4,
    this.child,
    this.color = Colors.white,
    this.ratio = 1.0,
    this.height,
    this.width,
    this.direction,
    this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        scrollDirection: direction,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: column,
          childAspectRatio: ratio,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
        ),
        itemCount: items,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
