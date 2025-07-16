import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/utils/m_img.dart';
import 'package:ballkkaye_frontend/data/enum/result.dart';
import 'package:ballkkaye_frontend/data/model/visit_record.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/widgets/visit_record_img_thumbnail.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/visit_record_write_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/widgets/visit_record_write_game_card.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_icon_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_img_action_sheet.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_toggle_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class VisitRecordWriteForm extends ConsumerStatefulWidget {
  final VisitRecord selectedGame;

  const VisitRecordWriteForm({
    super.key,
    required this.selectedGame,
  });

  @override
  ConsumerState<VisitRecordWriteForm> createState() => _VisitRecordWriteFormState();
}

class _VisitRecordWriteFormState extends ConsumerState<VisitRecordWriteForm> {
  String selectedResultLabel = "";

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

      ref.read(visitRecordWriteProvider.notifier).imgUrl(result.url);

      print("✅ 업로드 완료: ${result.url}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final writeModel = ref.read(visitRecordWriteProvider.notifier);
    final model = ref.read(visitRecordWriteProvider);
    print("✅ 저장되고있는 이미지: ${model.imgUrl}");

    bool hasImage = true;
    List<String> results = ['승', '무', '패'];
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 경기 카드
          Column(
            children: [
              VisitRecordWriteGameCard(selectedGame: widget.selectedGame),
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
              // MToggleBtn(
              //   options: results,
              //   onSelected: (value) {
              //     writeModel.result(value);
              //   },
              // ),
              MToggleBtn(
                options: Result.values.map((g) => g.label).toList(),
                selectedValue: selectedResultLabel,
                onSelected: (label) {
                  writeModel.result(Result.fromLabel(label).name);
                  setState(() {
                    selectedResultLabel = label;
                  });
                  Logger().d("게임결과 버튼 선택 : ${Result.fromLabel(label).name}");
                },
              ),
              SizedBox(height: 20),
              // 내용 입력 필드
              MTextFormField(
                hintText: "경기 기록을 자유롭게 적어주세요",
                maxLines: 6,
                maxLength: 1000,
                onChanged: (value) {
                  writeModel.content(value);
                },
                keyboardType: TextInputType.text,
              ),
            ],
          ),

          // 🟡 기존에 버튼 spacer로 되어있어 기기별로 이미지가 추가되었을 때
          // 전체적인 디자인이 화면 바깥으로 삐져나감 SingleChildScrollView 로 감싸며
          // spacer 사용 시 화면이 출력되지 않는 이슈 있음 그래서 버튼을 가장 바깥으로 빼 구조변경
        ],
      ),
    );
  }
}
