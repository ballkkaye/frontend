import 'package:ballkkaye_frontend/ui/widgets/m_alert_dialog.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_update_delete_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MMoreOptionBtn extends StatelessWidget {
  final Widget icon;
  final VoidCallback onUpdate;

  final String alertTitle;
  final String alertContent;
  final VoidCallback onAlertConfirm;
  final VoidCallback onAlertCancel;
  final String alertConfirmText;
  final String alertCancelText;

  const MMoreOptionBtn({
    super.key,
    required this.icon,
    required this.onUpdate,
    required this.alertTitle,
    required this.alertContent,
    required this.onAlertConfirm,
    required this.onAlertCancel,
    required this.alertConfirmText,
    required this.alertCancelText,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => MUpdateDeleteActionSheet(
            onUpdate: () {
              Navigator.pop(context);
              onUpdate();
            },
            onDelete: () {
              Navigator.pop(context);
              showCupertinoDialog(
                context: context,
                builder: (context) => MAlertDialog(
                  title: alertTitle,
                  content: alertContent,
                  confirmText: alertConfirmText,
                  cancelText: alertCancelText,
                  onConfirm: () {
                    Navigator.pop(context); // 다이얼로그 닫기
                    onAlertConfirm();
                  },
                  onCancel: () {
                    Navigator.pop(context); // 다이얼로그 닫기
                    onAlertCancel();
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
