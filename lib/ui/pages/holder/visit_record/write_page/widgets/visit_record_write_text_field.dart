import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class VisitRecordWriteTextField extends StatelessWidget {
  const VisitRecordWriteTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 6,
      maxLength: 1000,
      decoration: InputDecoration(
        hintText: "경기 기록을 자유롭게 적어주세요",
        hintStyle: TextStyle(color: MColor.kLabel.disable),
        counterText: "0 / 1000",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: MColor.kLine.normal),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: MColor.kLine.normal),
        ),
      ),
    );
  }
}
