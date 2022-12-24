import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/ebook/models/book.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatefulWidget {
  final EBook ebook;
  const PDFScreen({super.key, required this.ebook});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor4,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _pdfViewerStateKey.currentState!.openBookmarkView();
            },
            icon: const Icon(Icons.bookmark),
            iconSize: 24,
          ),
          IconButton(
            onPressed: () {
              _pdfViewerController.jumpToPage(5);
              
            },
            icon: const Icon(Icons.arrow_drop_down_circle_outlined),
            iconSize: 24,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _pdfViewerController.zoomLevel = 1.25;
              },
              onDoubleTap: () {
                _pdfViewerController.zoomLevel = 1.0;
              },
              child: const Icon(
                Icons.zoom_in_sharp,
                size: 32,
              ),
            ),
          ),
        ],
        title: Text(widget.ebook.title ?? ''),
      ),
      body: SfPdfViewer.asset(
        'assets/pdf/dacnhantam.pdf',
        controller: _pdfViewerController,
        key: _pdfViewerStateKey,
      ),
    );
  }
}
