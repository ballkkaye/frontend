import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/widget/prediction_graph_value.dart';

class PredictionGraphValueState extends State<PredictionGraphValue>
    with SingleTickerProviderStateMixin {
  late double leftRatio = 0;
  late double rightRatio = 0;
  late bool isLeftHigher;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    final total = widget.leftScore + widget.rightScore;
    isLeftHigher = widget.leftScore > widget.rightScore;
    if (total == 0) {
      leftRatio = 0.5;
      rightRatio = 0.5;
    }
  }

  void startAnimation() {
    if (!isVisible) {
      final total = widget.leftScore + widget.rightScore;
      setState(() {
        leftRatio = total == 0 ? 0.5 : widget.leftScore / total;
        rightRatio = total == 0 ? 0.5 : widget.rightScore / total;
        isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('PredictionGraph-${widget.leftScore}-${widget.rightScore}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          startAnimation();
        }
      },
      child: LayoutBuilder(
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
                  //duration: Duration(milliseconds: 800),
                  duration: isLeftHigher
                      ? Duration(milliseconds: 800)
                      : Duration.zero,
                  width: width * leftRatio,
                  decoration: BoxDecoration(
                    color: isLeftHigher
                        ? MColor.kPrimary.alternative
                        : Colors.transparent,
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
                    // duration: Duration(milliseconds: 800),
                    duration: isLeftHigher
                        ? Duration.zero
                        : Duration(milliseconds: 800),
                    width: width * rightRatio,
                    decoration: BoxDecoration(
                      color: !isLeftHigher
                          ? MColor.kPrimary.alternative
                          : Colors.transparent,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(8),
                        left: Radius.circular(!isLeftHigher ? 8 : 0),
                      ),
                    ),
                  ),
                ),

                // 텍스트
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: MText.normal6_6(
                          widget.leftScore.toStringAsFixed(1),
                          color: isLeftHigher
                              ? MColor.kLabel.white
                              : MColor.kLabel.alternative,
                        ),
                      ),
                      Center(
                        child: MText.normal6_6(
                          widget.rightScore.toStringAsFixed(1),
                          color: isLeftHigher
                              ? MColor.kLabel.alternative
                              : MColor.kLabel.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
