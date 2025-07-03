import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/widget/prediction_graph_value.dart';
import 'package:flutter/material.dart';

class PredictionGraphValueState extends State<PredictionGraphValue> with SingleTickerProviderStateMixin {
  late double leftRatio;
  late double rightRatio;
  late bool isLeftHigher;

  @override
  void initState() {
    super.initState();
    calculateRatio();
  }

  void calculateRatio() {
    final total = widget.leftScore + widget.rightScore;
    leftRatio = total == 0 ? 0.5 : widget.leftScore / total;
    rightRatio = total == 0 ? 0.5 : widget.rightScore / total;
    isLeftHigher = widget.leftScore > widget.rightScore;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Container(
          height: 24,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              // 왼쪽 바
              AnimatedContainer(
                duration: Duration(milliseconds: 800),
                width: width * leftRatio,
                decoration: BoxDecoration(
                  color: isLeftHigher ? MColor.kPrimary.alternative : MColor.kFill.normal,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(8),
                    right: Radius.circular(isLeftHigher ? 8 : 0),
                  ),
                ),
              ),

              // 오른쪽 바
              Align(
                alignment: Alignment.centerRight,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  width: width * rightRatio,
                  decoration: BoxDecoration(
                    color: !isLeftHigher ? MColor.kPrimary.alternative : MColor.kFill.normal,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(8),
                      left: Radius.circular(!isLeftHigher ? 8 : 0),
                    ),
                  ),
                ),
              ),

              // 텍스트 레이어
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: MText.normal6_600(
                        widget.leftScore.toStringAsFixed(1),
                        color: isLeftHigher ? MColor.kLabel.white : MColor.kLabel.alternative,
                      ),
                    ),
                    Center(
                      child: MText.normal6_600(
                        widget.leftScore.toStringAsFixed(1),
                        color: isLeftHigher ? MColor.kLabel.alternative : MColor.kLabel.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
