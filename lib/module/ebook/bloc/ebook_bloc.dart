import 'dart:async';

import 'package:project_ebook/module/ebook/models/book.dart';
import 'package:project_ebook/services/ebook_service.dart';

class EbookBloc {
  final _ebookStreamController = StreamController<List<EBook>>.broadcast();
  Stream<List<EBook>> get streamEbook => _ebookStreamController.stream;

  final ebooks = <EBook>[];
  EbookBloc() {
    getEbook();
  }

  Future getEbook() async {
    await eBookService.getEbook().then((value) {
      ebooks.addAll(value);
      _ebookStreamController.add(ebooks);
    }).catchError((e) {
      _ebookStreamController.addError(e.toString());
    });
  }
}
