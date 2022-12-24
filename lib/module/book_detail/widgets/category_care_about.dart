import 'package:flutter/material.dart';

import 'package:project_ebook/effect/transition/scale_route.dart';
import 'package:project_ebook/module/book_detail/screens/book_detail_screen.dart';

import 'package:project_ebook/module/ebook/models/book.dart';

class CategoryCareAbout extends StatefulWidget {
  const CategoryCareAbout({super.key, required this.books});
  final List<EBook> books;

  @override
  State<CategoryCareAbout> createState() => _CategoryCareAboutState();
}

class _CategoryCareAboutState extends State<CategoryCareAbout> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Có thể bạn quan tâm',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Container(
            width: double.infinity,
            height: size.height * 0.23,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                final book = widget.books[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(ScaleRoute(
                        page: BookDetailScreen(
                      book: book,
                      ebook: widget.books,
                    )));
                  },
                  child: Container(
                    width: size.width * 0.3,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              book.url ?? '',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              book.title ?? '',
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              }),
              itemCount: widget.books.length,
            ),
          ),
        ],
      ),
    );
  }
}
