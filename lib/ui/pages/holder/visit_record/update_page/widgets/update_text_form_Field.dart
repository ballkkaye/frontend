import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class UpdateTextFormField extends StatelessWidget {
  const UpdateTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "경기 진짜 재밌었다~",
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
      onChanged: (value) {}, // TODO: 내용 변경 이벤트
    );
  }
}
