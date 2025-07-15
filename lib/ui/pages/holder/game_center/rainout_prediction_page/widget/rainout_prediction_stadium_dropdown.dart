import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/rainout_prediction_stadium_vm.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RainoutPredictionStadiumDropdown extends ConsumerWidget {
  final int? selectedStadiumId;
  final void Function(int?) onChanged;

  const RainoutPredictionStadiumDropdown({
    super.key,
    required this.selectedStadiumId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RainoutPredictionStadiumModel? model = ref.watch(rainoutPredictionStadiumProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
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
            items: model.stadiums.map((stadium) {
              return DropdownMenuItem<int>(
                value: stadium.stadiumId,
                child: MText.button4_4(
                  stadium.stadiumName!,
                  color: MColor.kLabel.alternative,
                ),
              );
            }).toList(),
            buttonStyleData: ButtonStyleData(
              height: 29,
              width: 120,
              padding: EdgeInsets.symmetric(horizontal: 10),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
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
}
