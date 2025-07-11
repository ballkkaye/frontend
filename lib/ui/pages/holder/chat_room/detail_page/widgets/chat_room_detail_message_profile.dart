import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:flutter/material.dart';

class ChatRoomDetailMessageProfile extends StatelessWidget {
  // final String? userProfileImg;

  const ChatRoomDetailMessageProfile({
    super.key,
  }); //this.userProfileImg

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 30,
        height: 30,
        color: Colors.grey.shade300,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 21,
            height: 21,
            child: MIcon.page.mypage.userDummy,
          ),
        ),
      ),
    );
  }
}
