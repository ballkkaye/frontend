import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:flutter/material.dart';

class UserPredictionLeftTeam extends StatelessWidget {
  final String teamName;
  final int score;

  const UserPredictionLeftTeam({
    super.key,
    required this.teamName,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        //TODO 클릭 시 상태 저장하는 추가 작업 필요 (stateful)
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
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
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 60,
                        height: 60,
                        color: MColor.kFill.normal,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: MIcon.page.userPrediction.image,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      teamName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: MColor.kLabel.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 28),
                Text(
                  '${score}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: MColor.kLabel.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
