import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/cupertino.dart';

class MAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String confirmText;
  final String cancelText;

  const MAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
    required this.confirmText,
    required this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      // title: Text(title),
      title: MText.modal1(title),
      content: MText.modal3_4(content),
      actions: <CupertinoDialogAction>[
        // 왼쪽 버튼
        CupertinoDialogAction(
          onPressed: onCancel,
          isDefaultAction: true,
          child: MText.modal2_4(cancelText, color: MColor.kLabel.neutral),
        ),
        // 오른쪽 버튼
        CupertinoDialogAction(
          onPressed: onConfirm,
          isDestructiveAction: true,
          child: MText.modal2_4(confirmText),
        ),
      ],
    );
  }
}
