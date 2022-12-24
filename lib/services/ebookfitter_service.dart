import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/ebook/models/book.dart';

class FilterEbookService {
  static final _service = FilterEbookService._internal();
  factory FilterEbookService() => _service;
  FilterEbookService._internal();

  Future<List<EBook>> getFitterEbook(String query) async {
    final file = await rootBundle.loadString(baseJson);

    final json = jsonDecode(file);

    List ebookData = json['data'];

    return List<EBook>.from(
        ebookData.map((e) => EBook.fromJson(e)).where((book) {
      final titleLower = book.title!.toLowerCase();
      final authorLower = book.author!.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    })).toList();
  }
}

final fitterEbook = FilterEbookService();
