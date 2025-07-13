import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/data/model/board.dart';
import 'package:flutter/material.dart';

class HomeBoardContent extends StatelessWidget {
  final Board board;

  const HomeBoardContent({
    super.key,
    required this.board,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 280,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
            board.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: MColor.kLabel.normal,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 8),
              Text(
                board.content,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: MColor.kLabel.alternative,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
        Text(
          board.relativeTime,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: MColor.kLabel.alternative,
          ),
        )
      ],
    );
  }
}
