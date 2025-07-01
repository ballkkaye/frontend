import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class ListGameCard extends StatelessWidget {
  const ListGameCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/visit-record/detail');
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MText.scoreHuge("0", color: MColor.kLabel.disable),
              Column(
                children: [
                  Row(
                    children: [
                      MText.h1("한화", color: MColor.kLabel.normal),
                      SizedBox(width: 16),
                      MText.label2_5("vs", color: MColor.kLabel.normal),
                      SizedBox(width: 16),
                      MText.h1("키움", color: MColor.kLabel.normal),
                    ],
                  ),
                  SizedBox(height: 8),
                  MText.label3("2025.06.22", color: MColor.kLabel.alternative),
                  MText.label3("대전한화생명이글스파크", color: MColor.kLabel.alternative),
                ],
              ),
              MText.scoreHuge("5", color: MColor.kPrimary.strong),
            ],
          ),
        ),
      ),
    );
  }
}
