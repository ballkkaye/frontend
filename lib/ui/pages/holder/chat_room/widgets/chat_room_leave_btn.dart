import 'package:ballkkaye_frontend/ui/widgets/m_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoomLeaveBtn extends StatelessWidget {
  final Widget icon;
  final VoidCallback onConfirm;

  const ChatRoomLeaveBtn({
    super.key,
    required this.icon,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (context) => MAlertDialog(
            title: '채팅방 나가기',
            content: '채팅방에서 나가시겠습니까?',
            confirmText: '나가기',
            cancelText: '취소',
            onConfirm: () {
              Navigator.pop(context); // 다이얼로그 닫기
              onConfirm(); // 나가기 처리
            },
            onCancel: () {
              Navigator.pop(context); // 다이얼로그 닫기
            },
          ),
        );
      },
    );
  }
}
