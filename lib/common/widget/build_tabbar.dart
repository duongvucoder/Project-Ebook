import 'package:flutter/material.dart';
import 'package:project_ebook/module/book_latest/book_latest.dart';

import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/book_popular/book_popular_screen.dart';
import 'package:project_ebook/module/ebook/screens/ebook_screen.dart';

class BuildTabBar extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;

  const BuildTabBar(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3});

  @override
  State<BuildTabBar> createState() => _BuildTabBarState();
}

class _BuildTabBarState extends State<BuildTabBar>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final tabs = <Widget>[];
  final pages = <Widget>[];
  @override
  void initState() {
    tabs.addAll([
      Text(
        widget.text1,
        style: const TextStyle(color: Colors.black),
      ),
      Text(
        widget.text2,
        style: const TextStyle(color: Colors.black),
      ),
      Text(
        widget.text3,
        style: const TextStyle(color: Colors.black),
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
    return TabBar(
      controller: controller,
      tabs: tabs,
      labelPadding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      indicator: BoxDecoration(
        color: kPrimaryColor3,
        borderRadius: BorderRadius.circular(10),
      ),
      labelStyle: const TextStyle(fontSize: 18),
    );
  }

  Widget buildBody() {
    return TabBarView(
      controller: controller,
      children: pages,
    );
  }
}
