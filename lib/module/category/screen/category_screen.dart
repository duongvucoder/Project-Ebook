// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/effect/transition/scale_route.dart';
import 'package:project_ebook/module/category/bloc/category_bloc.dart';
import 'package:project_ebook/module/category/screen/list_category_screen.dart';
import 'package:project_ebook/module/category/widgets/categoryitems.dart';
import 'package:project_ebook/module/category/widgets/categoryview.dart';
import 'package:project_ebook/module/ebook/widgets/filter_listbook.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late CategoryBloc bloc;
  @override
  void initState() {
    bloc = CategoryBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Thể loại',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
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
                        builder: (context) => const FilterListBooks()));
              },
              color: kPrimaryColor5,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: bloc.streamCategory,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}
          if (snapshot.hasData) {
            final categories = snapshot.data!;
            return CategoryView(
              height: size.height,
              width: size.width,
              column: 2,
              items: categories.length,
              ratio: 1.3,
              direction: Axis.vertical,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      ScaleRoute(
                        page: ListCategoryScreen(
                          category: category.category ?? '',
                        ),
                      ),
                    );
                  },
                  child: CategoryItems(
                    height: size.height,
                    color: Colors.white.withOpacity(0.2),
                    // color: Colors.black87,
                    width: size.width,
                    radius: 8,
                    align: Alignment.center,
                    image: category.url,
                    category: category.category,
                    titleSize: 16,
                  ),
                );
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
