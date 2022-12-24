import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';
import 'package:project_ebook/module/ebook/widgets/category_carouseslider.dart';
import 'package:project_ebook/module/ebook/widgets/book_categories.dart';

class EbookScreen extends StatefulWidget {
  const EbookScreen({super.key});

  @override
  State<EbookScreen> createState() => _EbookScreenState();
}

class _EbookScreenState extends State<EbookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Container(
              height: 320,
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(300, 300),
                        bottomRight: Radius.elliptical(300, 300),
                      ),
                    ),
                  ),
                  const CatetoryCarouseSlider(),
                ],
              ),
            ),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Kỹ Năng Mềm'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Tình Cảm Lãng Mạn'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Hồi Ký - Danh Nhân'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Lịch Sử - Chính Trị'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Văn Học Nước Ngoài'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Trinh Thám - Kinh Dị'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Nuôi Dạy Con'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Kinh Tế - Tài Chính'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Khoa Học - Viễn Tưởng'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Tuổi Học Trò'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Tâm Lý Học'),
            buildSPacingDivder(),
            const BookCategories(textTopic: 'Văn Hoá - Tôn Giáo'),
          ],
        ),
      ),
      //  bottomNavigationBar: const BuildBottomNavigationBar(),
    );
  }

  Widget buildSPacingDivder() {
    return const Padding(
      padding: EdgeInsets.only(left: 24),
      child: Divider(
        thickness: 1,
      ),
    );
  }
}
