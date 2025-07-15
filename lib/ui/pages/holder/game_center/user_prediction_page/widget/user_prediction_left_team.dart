import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class UserPredictionLeftTeam extends StatelessWidget {
  final String teamName;
  final int score;
  final bool isSelected;
  final VoidCallback? onTap;
  final String teamLogo;

  const UserPredictionLeftTeam({
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
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? MColor.kBackground.alternative
                  : MColor.kBackground.normal,
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              teamLogo,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/lotte_emblem_sample.png',
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
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
                  const SizedBox(width: 28),
                  MText.normal2_6(
                    '${score}',
                    color: MColor.kLabel.normal,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
