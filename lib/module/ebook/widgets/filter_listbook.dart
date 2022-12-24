import 'package:flutter/material.dart';
import 'package:project_ebook/module/book_detail/screens/book_detail_screen.dart';
import 'package:project_ebook/module/ebook/bloc/ebook_bloc.dart';
import 'package:project_ebook/module/ebook/models/book.dart';
import 'package:project_ebook/module/ebook/widgets/seach_widget.dart';
import 'package:project_ebook/services/ebookfitter_service.dart';

class FilterListBooks extends StatefulWidget {
  const FilterListBooks({super.key});

  @override
  State<FilterListBooks> createState() => _FilterListBooksState();
}

class _FilterListBooksState extends State<FilterListBooks> {
  String query = '';
  List<EBook> books = [];
  late EbookBloc bloc;
  @override
  void initState() {
    bloc = EbookBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<EBook>>(
        stream: bloc.streamEbook,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(height: 64),
                buildSeach(books),
                Expanded(
                  child: ListView.builder(
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
                          child: buildBook(book));
                    },
                    itemCount: books.length,
                  ),
                ),
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget buildBook(EBook eBook) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          eBook.url ?? '',
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
      ),
      title: Text(
        eBook.title ?? '',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(eBook.author ?? ''),
    );
  }

  Widget buildSeach(List<EBook> ebook) {
    return SeachWidget(
        text: query, onChanged: seachBook, hinText: 'Nhập từ khoá tìm kiếm');
  }

  Future seachBook(String query) async {
    final books = await fitterEbook.getFitterEbook(query);
    if (!mounted) return;
    setState(() {
      this.query = query;
      this.books = books;
    });
  }
}
