import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_ebook/module/book_detail/screens/book_detail_screen.dart';
import 'package:project_ebook/module/ebook/bloc/ebook_bloc.dart';
import 'package:project_ebook/module/ebook/models/book.dart';

class CatetoryCarouseSlider extends StatefulWidget {
  const CatetoryCarouseSlider({super.key});

  @override
  State<CatetoryCarouseSlider> createState() => _CatetoryCarouseSliderState();
}

class _CatetoryCarouseSliderState extends State<CatetoryCarouseSlider> {
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
              .where((element) => element.populer!.contains('B'))
              .toList();
          return CarouselSlider.builder(
            itemCount: books.length,
            itemBuilder: (context, index, _) {
              final book = books[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
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
                      height: size.height * 0.27,
                      width: size.width * 0.35,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          book.url ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      book.title ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      book.author ?? '',
                      maxLines: 1,
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
              height: size.height * 0.4,
              viewportFraction: 0.5,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
