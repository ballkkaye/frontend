import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class WriteResultSelector extends StatelessWidget {
  const WriteResultSelector({super.key});

  @override
  Widget build(BuildContext context) {
    String selected = 'lose';

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          // 승
          Expanded(
            child: Material(
              child: InkWell(
                onTap: () {
                  selected = 'win';
                  print(selected);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    // 테두리 색상
                    border: Border.all(
                        color: selected == 'win'
                            ? MColor.kPrimary.strong
                            : MColor.kLine.normal),
                  ),
                  child: MText.button3("승",
                      color: selected == 'win'
                          ? MColor.kPrimary.strong
                          : MColor.kLabel.alternative),
                ),
              ),
            ),
          ),
          // 무
          Expanded(
            child: Material(
              child: InkWell(
                onTap: () {
                  selected = 'draw';
                  print(selected);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // 테두리 색상
                    border: Border.all(
                        color: selected == 'draw'
                            ? MColor.kPrimary.strong
                            : MColor.kLine.normal),
                  ),
                  child: MText.button3("무",
                      color: selected == 'draw'
                          ? MColor.kPrimary.strong
                          : MColor.kLabel.alternative),
                ),
              ),
            ),
          ),
          // 패
          Expanded(
            child: Material(
              child: InkWell(
                onTap: () {
                  selected = 'lose';
                  print(selected);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    // 테두리 색상
                    border: Border.all(
                        color: selected == 'lose'
                            ? MColor.kPrimary.strong
                            : MColor.kLine.normal),
                  ),
                  child: MText.button3("패",
                      color: selected == 'lose'
                          ? MColor.kPrimary.strong
                          : MColor.kLabel.alternative),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
