import 'dart:async';

import 'package:project_ebook/module/category/models/category.dart';
import 'package:project_ebook/services/category_service.dart';

class CategoryBloc {
  final _categoryStreamController = StreamController<List<Category>>();
  Stream<List<Category>> get streamCategory => _categoryStreamController.stream;

  final categories = <Category>[];
  CategoryBloc() {
    getCategory();
  }

  Future getCategory() async {
    await categoryService.getCategory().then((value) {
      categories.addAll(value);
      _categoryStreamController.add(categories);
    }).catchError((e) {
      _categoryStreamController.addError(e.toString());
    });
  }
}
