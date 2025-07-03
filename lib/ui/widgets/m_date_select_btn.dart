import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_date_picker.dart';
import 'package:flutter/material.dart';

class MDateSelectBtn extends StatelessWidget {
  const MDateSelectBtn({
    super.key,
    required this.minimumDate,
    required this.maximumDate,
    required this.text,
    required this.onDateTimeChanged,
  });

  final DateTime minimumDate;
  final DateTime maximumDate;
  final String text;
  final ValueChanged<DateTime> onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: MColor.kBackground.normal,
            context: context,
            builder: (context) {
              return SizedBox(
                height: 250,
                child: MDatePicker(
                  minimumDate: minimumDate,
                  maximumDate: maximumDate,
                  onDateTimeChanged: onDateTimeChanged,
                ),
              );
            },
          );
        },
        icon: MIcon.page.record.calendarBlack,
        label: MText.input1_5(text, color: MColor.kLabel.normal),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(
            color: MColor.kLine.normal,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
