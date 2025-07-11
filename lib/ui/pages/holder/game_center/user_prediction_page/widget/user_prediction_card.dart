import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_score_group.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_time_group.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_vote_group.dart';
import 'package:flutter/material.dart';

class UserPredictionCard extends StatefulWidget {
  final String leftTeamName;
  final String rightTeamName;
  final int leftScore;
  final int rightScore;
  final double leftPercent;
  final double rightPercent;
  final int startHour;
  final int startMinute;

  const UserPredictionCard({
    super.key,
    required this.leftTeamName,
    required this.rightTeamName,
    required this.leftScore,
    required this.rightScore,
    required this.leftPercent,
    required this.rightPercent,
    required this.startHour,
    required this.startMinute,
  });

  @override
  State<UserPredictionCard> createState() => _UserPredictionCardState();
}

class _UserPredictionCardState extends State<UserPredictionCard> {
  int? _selectedTeam; // 0 = 왼쪽, 1 = 오른쪽

  void _selectLeft() {
    setState(() {
      _selectedTeam = 0;
    });
  }

  void _selectRight() {
    setState(() {
      _selectedTeam = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: MColor.kLine.normal,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              UserPredictionTimeGroup(
                hour: widget.startHour,
                minute: widget.startMinute,
              ),
              UserPredictionScoreGroup(
                leftTeamName: widget.leftTeamName,
                leftScore: widget.leftScore,
                rightTeamName: widget.rightTeamName,
                rightScore: widget.rightScore,
                isLeftSelected: _selectedTeam == 0,
                isRightSelected: _selectedTeam == 1,
                onTapLeft: () {
                  setState(() {
                    _selectedTeam = 0;
                  });
                },
                onTapRight: () {
                  setState(() {
                    _selectedTeam = 1;
                  });
                },
              ),
              UserPredictionVoteGroup(
                leftPercent: widget.leftPercent,
                rightPercent: widget.rightPercent,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
