import 'package:flutter/material.dart';
import 'package:project_ebook/module/book_latest/book_latest.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/book_popular/book_popular_screen.dart';
import 'package:project_ebook/module/ebook/bloc/ebook_bloc.dart';
import 'package:project_ebook/module/ebook/screens/ebook_screen.dart';
import 'package:project_ebook/module/ebook/widgets/filter_listbook.dart';

class TopTabBar extends StatefulWidget {
  const TopTabBar({super.key});

  @override
  State<TopTabBar> createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar>
    with SingleTickerProviderStateMixin {
  late EbookBloc bloc;
  late TabController controller;
  final tabs = <Widget>[];
  final pages = <Widget>[];

  @override
  void initState() {
    tabs.addAll([
      const Text(
        'Khám Phá',
        style: TextStyle(color: Colors.black),
      ),
      const Text(
        'Phổ Biến',
        style: TextStyle(color: Colors.black),
      ),
      const Text(
        'Mới Nhất',
        style: TextStyle(color: Colors.black),
      ),
    ]);
    pages.addAll([
      const EbookScreen(),
      const BookPopularScreen(),
      const BookLatestScreen(),
    ]);
    controller = TabController(
      length: tabs.length,
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text(
          'Trang Chủ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                size: 32,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FilterListBooks(),
                  ),
                );
              },
              color: kPrimaryColor5,
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: size.height * 0.04,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kPrimaryLightColor,
              border: Border.all(
                color: kPrimaryColorIconsEbook,
              ),
            ),
            child: TabBar(
              tabs: tabs,
              controller: controller,
              labelPadding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              indicator: BoxDecoration(
                color: kPrimaryColor3,
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: const TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: pages,
            ),
          ),
        ],
      ),
    );
  }
}
