import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:flutter/material.dart';

class TodayGameTeamLogo extends StatelessWidget {
  final String? photoUrl;

  const TodayGameTeamLogo({
    super.key,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 60,
          height: 60,
          color: MColor.kFill.normal,
          child: (photoUrl == null || photoUrl!.isEmpty)
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MIcon.page.userPrediction.image,
                )
              : Image.network(
                  photoUrl!,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
