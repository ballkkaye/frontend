import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailActionSheet extends StatelessWidget {
  const DetailActionSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_horiz),
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                child: MText.modal2_4("수정하기", color: MColor.kLabel.strong),
                onPressed: () {
                  Navigator.pop(context);
                  // 수정 로직
                },
              ),
              CupertinoActionSheetAction(
                child: MText.modal2_4("삭제하기", color: MColor.kLabel.strong),
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context);
                  // 삭제 로직
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: MText.modal2_4("취소", color: MColor.kLabel.strong),
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
}
