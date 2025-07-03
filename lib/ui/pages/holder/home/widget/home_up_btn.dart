import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class HomeUpBtn extends StatelessWidget {
  const HomeUpBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: MColor.kLine.normal)),
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            side: BorderSide.none,
          ),
          child: MText.button5_6(
            '맨위로',
            color: MColor.kLabel.alternative,
          ),
        ),
      ),
    );
  }
}
