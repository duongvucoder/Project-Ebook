import 'package:flutter/material.dart';
import 'package:project_ebook/module/book_detail/screens/book_detail_screen.dart';
import 'package:project_ebook/module/ebook/bloc/ebook_bloc.dart';
import 'package:project_ebook/module/ebook/models/book.dart';

class FilterCategory extends StatefulWidget {
  String category;
  FilterCategory({super.key, required this.category});
  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {
  late EbookBloc bloc;
  @override
  void initState() {
    bloc = EbookBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder<List<EBook>>(
      stream: bloc.streamEbook,
      builder: (context, snapshot) {
        if (snapshot.hasError) {}
        if (snapshot.hasData) {
          final books = snapshot.data!
              .where((element) => element.category!.contains(widget.category))
              .toList();
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final book = books[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailScreen(
                        book: books[index],
                        ebook: books,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            book.url ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
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
            },
            itemCount: books.length - 5,
            separatorBuilder: (context, index) => const SizedBox(
              width: 12,
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
