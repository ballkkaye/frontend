import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class RainoutPredictionStadiumDropdown extends StatelessWidget {
  const RainoutPredictionStadiumDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> stadiums = [
      '경기장선택',
      '잠실야구장',
      '고척스카이돔',
      '인천SSG랜더스필드',
      '수원KT위즈파크',
      '광주기아챔피언스필드',
      '대구삼성라이온즈파크',
      '사직야구장',
      '창원NC파크',
      '대전이글스파크',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: MColor.kLine.normal),
        borderRadius: BorderRadius.circular(50),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          value: stadiums.first,
          onChanged: (_) {},
          items: stadiums.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: MText.button4_4(
                item,
                color: MColor.kLabel.alternative,
              ),
            );
          }).toList(),
          buttonStyleData: ButtonStyleData(
            height: 29,
            width: 120,
            padding: EdgeInsets.symmetric(horizontal: 10),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          dropdownStyleData: DropdownStyleData(
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
