import 'package:flutter/material.dart';

class HearderPage extends StatefulWidget {
  const HearderPage({super.key});

  @override
  State<HearderPage> createState() => _HearderPageState();
}

class _HearderPageState extends State<HearderPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHeader(),
        const SizedBox(height: 16),
        //buildUser(context),
      ],
    );
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/avatar/duongvu.jpeg',
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            children: const [
              Text(
                'Dương Vũ',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '0974960508',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
