import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class RainoutPredictionStadiumDropdown extends StatelessWidget {
  final int? selectedStadiumId;
  final void Function(int?) onChanged;

  const RainoutPredictionStadiumDropdown({
    super.key,
    required this.selectedStadiumId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // 지금은 임시 하드코딩, 추후 provider로 대체
    final List<Map<String, dynamic>> stadiums = [
      {'id': 1, 'name': '잠실야구장'},
      {'id': 2, 'name': '고척스카이돔'},
      {'id': 3, 'name': '인천SSG랜더스필드'},
      {'id': 4, 'name': '수원KT위즈파크'},
      {'id': 5, 'name': '광주기아챔피언스필드'},
      {'id': 6, 'name': '대구삼성라이온즈파크'},
      {'id': 7, 'name': '사직야구장'},
      {'id': 8, 'name': '창원NC파크'},
      {'id': 9, 'name': '대전이글스파크'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: MColor.kLine.normal),
        borderRadius: BorderRadius.circular(50),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<int>(
          // 아무것도 선택되지 않았을 때
          hint: MText.button4_4('경기장 선택', color: MColor.kLabel.alternative),
          isExpanded: true,
          // 현재 선택된 값
          value: selectedStadiumId,
          // 값이 선택되었을 때 호출될 콜백
          onChanged: onChanged,
          // 드롭다운 항목 리스트
          items: stadiums.map((item) {
            return DropdownMenuItem<int>(
              value: item['id'],
              child: MText.button4_4(
                item['name'],
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
