import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/book_detail/screens/book_detail_screen.dart';
import 'package:project_ebook/module/ebook/bloc/ebook_bloc.dart';
import 'package:project_ebook/module/ebook/models/book.dart';

class ListCategoryScreen extends StatefulWidget {
  final String category;
  const ListCategoryScreen({super.key, required this.category});

  @override
  State<ListCategoryScreen> createState() => _ListCategoryScreenState();
}

class _ListCategoryScreenState extends State<ListCategoryScreen> {
  late EbookBloc bloc;
  @override
  void initState() {
    bloc = EbookBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.category,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: kPrimaryColor5,
            size: 28,
          ),
        ),
      ),
      body: StreamBuilder<List<EBook>>(
        stream: bloc.streamEbook,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}
          if (snapshot.hasData) {
            final books = snapshot.data!
                .where((element) => element.category!.contains(widget.category))
                .toList();

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 210,
                ),
                itemCount: books.length,
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
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              book.url ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
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
                  );
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
