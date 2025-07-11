import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/utils/m_img.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_img_thumbnail.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_icon_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_img_action_sheet.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_toggle_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class VisitRecordWriteForm extends StatefulWidget {
  const VisitRecordWriteForm({
    super.key,
  });

  @override
  State<VisitRecordWriteForm> createState() => _VisitRecordWriteFormState();
}

class _VisitRecordWriteFormState extends State<VisitRecordWriteForm> {
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
    bool hasImage = true;
    List<String> results = ['승', '무', '패'];
    return Form(
      child: Column(
        children: [
          // 경기 카드
          VisitRecordGame(),
          SizedBox(height: 20),
          // 사진 첨부 버튼
          MIconBtn(
            height: 49,
            icon: MIcon.page.record.camera,
            text: '사진 첨부하기',
            onPressed: () {
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
            },
            textColor: MColor.kLabel.alternative,
          ),
          SizedBox(height: 20),
          if (uploadedUrl != null) ...[
            VisitRecordThumbnail(imageUrl: uploadedUrl!),
            SizedBox(height: 20),
          ],
          // 승 무 패 선택 버튼
          MToggleBtn(
            options: results,
            onSelected: (value) {
              print(value);
            },
          ),
          SizedBox(height: 20),
          // 내용 입력 필드
          MTextFormField(
            hintText: "경기 기록을 자유롭게 적어주세요",
            maxLines: 6,
            maxLength: 1000,
            onChanged: (value) {},
            keyboardType: TextInputType.text,
          ),
          Spacer(),
          // 작성 완료 버튼
          MElevatedBtn(
            text: '완료',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
