import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class JoinNextBtn extends StatelessWidget {
  const JoinNextBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 61,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MColor.kPrimary.strong,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/login"); // 다음페이지 제작해서 다음페이지로 넘어가도록
          // TODO: 유효성 검사 로직으로 변경
        },
        child: MText.button2('다음', color: MColor.kLabel.white),
      ),
    );
  }
}
