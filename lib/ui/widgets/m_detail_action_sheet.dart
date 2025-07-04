import 'package:ballkkaye_frontend/ui/widgets/m_action_btn.dart';
import 'package:flutter/cupertino.dart';

class MDetailActionSheet extends StatelessWidget {
  final VoidCallback onUpdate;
  final VoidCallback onDelete;

  const MDetailActionSheet({
    super.key,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        MActionBtn(
          text: '수정하기',
          onPressed: onUpdate,
        ),
        MActionBtn(
          text: '삭제하기',
          onPressed: onDelete,
        ),
      ],
      cancelButton: MActionBtn(
        text: '취소',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
