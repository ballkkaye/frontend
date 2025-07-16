import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/utils/m_img.dart';
import 'package:ballkkaye_frontend/ui/pages/board/write_page/board_write_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/board/write_page/widgets/board_write_img_thumbnail.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_img_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BoardWriteImgSelector extends StatefulWidget {
  final BoardWriteFM fm;

  const BoardWriteImgSelector({
    super.key,
    required this.fm,
  });

  @override
  State<BoardWriteImgSelector> createState() => _BoardWriteImgSelectorState();
}

class _BoardWriteImgSelectorState extends State<BoardWriteImgSelector> {
  XFile? imageFile;
  String? uploadedUrl;
  String? selectedResult;

  Future<void> pickAndUploadImg(ImageSource source) async {
    final result = await MImg.pickAndUploadImg(source);
    if (result != null) {
      setState(() {
        imageFile = result.file;
        uploadedUrl = result.url;
      });
      widget.fm.addImageUrl(result.url);
      print("✅ 업로드 완료: ${result.url}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> currentImageUrls = widget.fm.state.imageUrl;

    return Row(
      children: [
        // 이미지 추가 버튼
        InkWell(
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => MImgActionSheet(
                onCamera: () {
                  Navigator.pop(context);
                  pickAndUploadImg(ImageSource.camera);
                },
                onGallery: () {
                  Navigator.pop(context);
                  pickAndUploadImg(ImageSource.gallery);
                },
              ),
            );
          }, // TODO : image_picker 연결
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(color: MColor.kFill.normal, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_a_photo_outlined, color: MColor.kLabel.alternative),
                Text(
                  "${currentImageUrls.length}/10",
                  style: TextStyle(color: MColor.kLabel.alternative),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        // 이미지 썸네일
        Expanded(
          child: BoardImgThumbnail(imageUrls: currentImageUrls),
        )
      ],
    );
  }
}
