import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:flutter/material.dart';

class DetailInputField extends StatelessWidget {
  const DetailInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MColor.kBackground.alternative,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          MIcon.nav.top.plus,
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "메시지를 입력하세요",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.arrow_upward, color: MColor.kLabel.normal),
        ],
      ),
    );
  }
}
