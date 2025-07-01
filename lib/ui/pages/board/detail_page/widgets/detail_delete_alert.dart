import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/cupertino.dart';

class DetailDeleteAlert extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String confirmText;
  final String cancelText;

  const DetailDeleteAlert({
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
      title: Text(title),
      content: Text(content),
      actions: <CupertinoDialogAction>[
        // 왼쪽 버튼
        CupertinoDialogAction(
          onPressed: onCancel,
          isDefaultAction: true,
          child: Text(
            cancelText,
            style: TextStyle(color: MColor.kLabel.neutral),
          ),
        ),
        // 오른쪽 버튼
        CupertinoDialogAction(
          onPressed: onConfirm,
          isDestructiveAction: true,
          child: Text(confirmText),
        ),
      ],
    );
  }
}
