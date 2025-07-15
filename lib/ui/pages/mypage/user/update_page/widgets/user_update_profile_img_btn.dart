import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/utils/m_img.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/update_page/user_update_fm.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_img_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UserUpdateProfileImgBtn extends ConsumerStatefulWidget {
  const UserUpdateProfileImgBtn({super.key});

  @override
  ConsumerState<UserUpdateProfileImgBtn> createState() =>
      _UserUpdateProfileImgBtnState();
}

class _UserUpdateProfileImgBtnState
    extends ConsumerState<UserUpdateProfileImgBtn> {
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

      ref.read(userUpdateProvider.notifier).profileUrl(result.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
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
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: MColor.kFill.normal,
              radius: 40,
              child: uploadedUrl != null
                  ? ClipOval(
                      child: SizedBox(
                        width: 80, // CircleAvatar의 지름과 동일
                        height: 80,
                        child: Image.network(
                          uploadedUrl!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 40,
                      height: 40,
                      child: MIcon.page.mypage.image,
                    ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: SizedBox(
                    width: 14,
                    height: 14,
                    child: MIcon.page.mypage.plus, // + 아이콘
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
