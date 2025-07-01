import 'package:ballkkaye_frontend/ui/pages/board/detail_page/widgets/detail_delete_alert.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/widgets/detail_action_btn.dart';
import 'package:flutter/cupertino.dart';

class DetailActionSheet extends StatelessWidget {
  const DetailActionSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        DetailActionBtn(
          text: '수정하기',
          onPressed: () {
            Navigator.popAndPushNamed(context, "/board/update");
          },
        ),
        DetailActionBtn(
          text: '삭제하기',
          onPressed: () {
            Navigator.pop(context);
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => DetailDeleteAlert(
                title: '게시글 삭제',
                content: '게시글을 삭제하시겠습니까?',
                onConfirm: () {
                  Navigator.pop(context); // TODO : 삭제 로직
                },
                onCancel: () {
                  Navigator.pop(context);
                },
                confirmText: '삭제',
                cancelText: '취소',
              ),
            );
          },
        ),
      ],
      cancelButton: DetailActionBtn(
        text: '취소',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
