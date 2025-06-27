import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class UserPredictionPage extends StatelessWidget {
  const UserPredictionPage({super.key});

  final List<Map<String, dynamic>> predictionData = const [
    {'leftPercent': 30.0, 'rightPercent': 70.0},
    {'leftPercent': 83.0, 'rightPercent': 17.0},
    {'leftPercent': 45.0, 'rightPercent': 55.0},
    {'leftPercent': 10.0, 'rightPercent': 90.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MText.h1('나의승부예측'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(
          top: 22,
          right: 16,
          left: 16,
        ),
        itemCount: predictionData.length,
        itemBuilder: (context, index) {
          final data = predictionData[index];
          return PredictionCard(
            leftPercent: data['leftPercent'],
            rightPercent: data['rightPercent'],
          );
        },
      ),
    );
  }
}

class PredictionCard extends StatelessWidget {
  final double leftPercent;
  final double rightPercent;

  const PredictionCard({
    super.key,
    required this.leftPercent,
    required this.rightPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: MColor.kLine.normal),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 1,
              color: MColor.kLine.normal,
            ))),
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: UserPredictionLeftTeam(score: 2)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.5),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(
                          color: MColor.kLine.normal,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Center(
                      child: MIcon.page.userPrediction.success,
                    ),
                  ),
                  Expanded(child: UserPredictionRightTeam(score: 3)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Row(
                  children: [
                    Text(
                      '볼까예 투표율',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: MColor.kLabel.normal,
                      ),
                    ),
                    const SizedBox(width: 2),
                    MIcon.page.userPrediction.arrow,
                  ],
                ),
                const SizedBox(width: 8),
                Text(
                  '${leftPercent.toInt()}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: MColor.kLabel.alternative,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: PredictionBarChart(
                    leftPercent: leftPercent,
                    rightPercent: rightPercent,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${rightPercent.toInt()}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: MColor.kLabel.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget UserPredictionLeftTeam({required int score}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
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
                '팀명',
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
            '$score',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: MColor.kLabel.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget UserPredictionRightTeam({required int score}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$score',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: MColor.kLabel.normal,
            ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MIcon.page.userPrediction.image,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '팀명',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: MColor.kLabel.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PredictionBarChart extends StatelessWidget {
  final double leftPercent;
  final double rightPercent;

  const PredictionBarChart({
    super.key,
    required this.leftPercent,
    required this.rightPercent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: rightPercent / 100,
            child: Container(
              decoration: BoxDecoration(
                color: MColor.kPrimary.alternative,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
