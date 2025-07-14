import 'package:ballkkaye_frontend/ui/widgets/m_action_btn.dart';
import 'package:flutter/cupertino.dart';

class MImgActionSheet extends StatelessWidget {
  final VoidCallback onCamera;
  final VoidCallback onGallery;

  const MImgActionSheet({
    super.key,
    required this.onCamera,
    required this.onGallery,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text('사진 선택'),
      message: Text('사진을 가져올 방식을 선택하세요.'),
      actions: [
        MActionBtn(
          text: '카메라로 촬영',
          onPressed: onCamera,
        ),
        MActionBtn(
          text: '갤러리에서 선택',
          onPressed: onGallery,
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
