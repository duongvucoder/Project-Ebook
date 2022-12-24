import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/ebook/models/book.dart';

class EbookService {
  static final _service = EbookService._internal();
  factory EbookService() => _service;
  EbookService._internal();

  Future<List<EBook>> getEbook() async {
    final file = await rootBundle.loadString(baseJson);
    //print(file);
    final json = jsonDecode(file);
    //print(json);
    List ebookData = json['data'];
    // print(ebookdata);

    List<EBook> books =
        List<EBook>.from(ebookData.map((e) => EBook.fromJson(e)));

    return books;
  }
}

final eBookService = EbookService();
