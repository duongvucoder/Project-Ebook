import 'package:flutter/material.dart';
import 'package:project_ebook/common/const.dart';

class SeachWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hinText;
  const SeachWidget(
      {super.key,
      required this.text,
      required this.onChanged,
      required this.hinText});

  @override
  State<SeachWidget> createState() => _SeachWidgetState();
}

class _SeachWidgetState extends State<SeachWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.grey);
    const styleHint = TextStyle(color: kPrimaryColor5);
    final style = widget.text.isNotEmpty ? styleHint : styleActive;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 42,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: kPrimaryColor4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                icon: const Icon(Icons.search, color: kPrimaryColor4),
                suffixIcon: widget.text.isNotEmpty
                    ? GestureDetector(
                        child: Icon(Icons.close, color: style.color),
                        onTap: () {
                          controller.clear();
                          widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      )
                    : null,
                hintText: widget.hinText,
                hintStyle: style,
                border: InputBorder.none,
              ),
              style: style,
              onChanged: widget.onChanged,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Huỷ',
              style: TextStyle(fontSize: 18, color: kPrimaryColor5),
            ),
          ),
        ),
      ],
    );
  }
}
