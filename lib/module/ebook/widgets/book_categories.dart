import 'package:flutter/material.dart';
import 'package:project_ebook/module/ebook/widgets/categrory_listview.dart';

class BookCategories extends StatelessWidget {
  final String textTopic;

  const BookCategories({super.key, required this.textTopic});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            textTopic,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: size.height * 0.23,
          child: FilterCategory(category: textTopic),
        ),
      ],
    );
  }
}
