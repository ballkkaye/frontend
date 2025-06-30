import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class UserPredictionTimeGroup extends StatelessWidget {
  final int hour;
  final int minute;

  const UserPredictionTimeGroup({
    super.key,
    required this.hour,
    required this.minute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: MColor.kPrimary.strong,
        border: Border(
          bottom: BorderSide(
            color: MColor.kLine.normal,
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          '${hour}:${minute}',
          style: TextStyle(
            color: MColor.kLabel.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
