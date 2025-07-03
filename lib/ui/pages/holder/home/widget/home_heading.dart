import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class HomeHeading extends StatelessWidget {
  final String title;
  final Widget uri;

  const HomeHeading({
    super.key,
    required this.title,
    required this.uri,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MText.h3_6(title, color: MColor.kLabel.normal),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => uri),
              );
            },
            child: Container(
              width: 44,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: MColor.kPrimary.strong),
                borderRadius: BorderRadius.circular(11),
              ),
              alignment: Alignment.center,
              child: MText.button5_6(
                '더보기',
                color: MColor.kPrimary.strong,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
