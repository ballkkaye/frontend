import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class UserPredictionRightTeam extends StatelessWidget {
  final String teamName;
  final int score;
  final bool isSelected;
  final VoidCallback? onTap;
  final String teamLogo;

  const UserPredictionRightTeam({
    super.key,
    required this.teamName,
    required this.score,
    required this.isSelected,
    required this.onTap,
    required this.teamLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        //TODO 클릭 시 상태 저장하는 추가 작업 필요 (stateful)
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? MColor.kBackground.alternative : MColor.kBackground.normal,
            border: Border(
              left: BorderSide(
                color: MColor.kLine.normal,
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MText.normal2_6(
                  '${score}',
                  color: MColor.kLabel.normal,
                ),
                const SizedBox(width: 28),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 60,
                        height: 60,
                        color: MColor.kFill.normal,
                        child: Image.network(
                          teamLogo,
                          fit: BoxFit.cover,
                          // errorBuilder: (context, error, stackTrace) {
                          //   return Image.asset(
                          //     'assets/images/lotte_emblem_sample.png',
                          //     fit: BoxFit.cover,
                          //   );
                          // },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MText.normal5_7(
                      teamName,
                      color: MColor.kLabel.normal,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
