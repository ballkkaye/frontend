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
            Navigator.pushNamed(context, "/visit-record/update");
          },
        ),
        DetailActionBtn(
          text: '삭제하기',
          onPressed: () {},
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
