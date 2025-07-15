import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/utils/m_img.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_img_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BoardWriteImgSelector extends StatefulWidget {
  const BoardWriteImgSelector({
    super.key,
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
      print("✅ 업로드 완료: ${result.url}");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  imageFile == null ? "0/10" : "1/10",
                  style: TextStyle(color: MColor.kLabel.alternative),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        // 이미지 썸네일
        Expanded(
          child: board_img_thumbnail(imageUrl: uploadedUrl),
        )
      ],
    );
  }
}

class board_img_thumbnail extends StatelessWidget {
  final imageUrl;

  const board_img_thumbnail({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return const SizedBox(); // 이미지 없으면 아무것도 안 그림
    }
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.network(
              imageUrl!,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }
}
