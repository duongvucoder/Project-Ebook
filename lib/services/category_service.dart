import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/category/models/category.dart';

class CategoryService {
  static final _service = CategoryService._internal();
  factory CategoryService() => _service;
  CategoryService._internal();

  Future<List<Category>> getCategory() async {
    final file = await rootBundle.loadString(baseCategory);
    //print(file);
    final json = jsonDecode(file);
    //print(json);
    List categoryData = json['data'];
    // print(ebookdata);

    List<Category> category =
        List<Category>.from(categoryData.map((e) => Category.fromJson(e)));

    return category;
  }
}

final categoryService = CategoryService();
