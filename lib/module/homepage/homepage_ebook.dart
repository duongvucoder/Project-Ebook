import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/favorite%20book/favorite_book.dart';
import 'package:project_ebook/module/homepage/toptabbar.dart';
import 'package:project_ebook/module/category/screen/category_screen.dart';
import 'package:project_ebook/module/setting/screen/setting_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final tabs = <Widget>[];
  final pages = <Widget>[];
  @override
  void initState() {
    tabs.addAll([
      const Tab(
        icon: Icon(
          Icons.home,
        ),
        text: 'Trang Chủ',
      ),
      const Tab(
        icon: Icon(
          Icons.auto_awesome_mosaic,
        ),
        text: 'Thể loại',
      ),
      const Tab(
        icon: Icon(Icons.auto_stories_sharp),
        text: 'Thư viện',
      ),
      const Tab(
        icon: Icon(Icons.settings),
        text: 'Cài đặt',
      ),
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
    return Scaffold(
      body: Center(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            TopTabBar(),
            CategoryScreen(),
            FavoriteBookScreen(),
            SettingScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        color: Colors.white,
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: kPrimaryColor5,
          tabs: tabs,
          controller: controller,
          indicator: const UnderlineTabIndicator(),
        ),
      ),
    );
  }
}
