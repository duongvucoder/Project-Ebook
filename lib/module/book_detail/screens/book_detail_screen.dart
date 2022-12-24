import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/book_detail/widgets/category_care_about.dart';
import 'package:project_ebook/module/ebook/models/book.dart';
import 'package:project_ebook/module/read_pdf/screens/pdf_screen.dart';

class BookDetailScreen extends StatefulWidget {
  final EBook book;
  final List<EBook> ebook;

  const BookDetailScreen({
    super.key,
    required this.book,
    required this.ebook,
  });

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  var notifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              buildBackground(),
              buildBacktoScreen(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.25),
                  buildBookTitle(),
                  buildListIconBook(),
                ],
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Giới thiệu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextTitlle(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              thickness: 1,
            ),
          ),
          CategoryCareAbout(books: widget.ebook),
        ],
      ),
    ));
  }

  Widget buildBackground() {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      width: double.infinity,
      child: Hero(
        transitionOnUserGestures: true,
        tag: widget.book.author ?? '',
        child: Image.asset(
          widget.book.url ?? '',
          fit: BoxFit.cover,
          color: Colors.white.withOpacity(0.2),
          colorBlendMode: BlendMode.modulate,
        ),
      ),
    );
  }

  Widget buildBacktoScreen() {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: size.height * 0.2,
            width: size.width * 0.2,
            decoration: const BoxDecoration(
              // color: Colors.yellow,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: (() {
                Navigator.pop(context);
              }),
              child: const Icon(
                Icons.arrow_back_ios,
                color: kPrimaryColor5,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          width: size.width * 0.5,
          height: size.height * 0.04,
          child: Text(
            widget.book.title ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              // color: kPrimaryColor5,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBookTitle() {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.book.url ?? '',
              height: size.height * 0.2,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.book.title ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(widget.book.author ?? ''),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kPrimaryColor)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFScreen(
                          ebook: widget.book,
                        ),
                      ),
                    );
                  },
                  child: const Text('Đọc ngay'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListIconBook() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: kPrimaryColor2),
          bottom: BorderSide(color: kPrimaryColor2),
        ),
        color: kPrimaryLightColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Icon(Icons.favorite_border_sharp),
              Text(widget.book.like.toString()),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.remove_red_eye_outlined),
              Text(widget.book.view.toString()),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.bookmarks_outlined),
              ),
              const Text('Đánh dấu'),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.calendar_month_outlined),
              Text(widget.book.year.toString()),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextTitlle() {
    return ValueListenableBuilder<bool>(
      valueListenable: notifier,
      builder: (context, value, _) {
        final line = notifier.value ? null : 3;
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor2),
                color: kPrimaryColor1,
              ),
              child: Text(
                widget.book.content ?? '',
                maxLines: line,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            GestureDetector(
              onTap: () {
                notifier.value = !notifier.value;
              },
              child: Row(
                children: [
                  Text(
                    (notifier.value ? 'Thu gọn' : 'Xem thêm'),
                    style: const TextStyle(
                      fontSize: 16,
                      color: kPrimaryColor5,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: kPrimaryColor5,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
