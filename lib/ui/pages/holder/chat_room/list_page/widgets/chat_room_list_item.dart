
import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class ChatRoomListItem extends StatelessWidget {
  const ChatRoomListItem({
    super.key,
    required this.chat,
  });

  final Map<String, String> chat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ClipOval(
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
          ),
          title: Text(
            chat['name']!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: MColor.kLabel.normal,
              height: 1.1,
            ),
          ),
          subtitle: MText.label3(
            chat['time']!,
            color: MColor.kLabel.neutral,
          ),
          trailing: MIcon.page.userMatch.dotVertical,
          onTap: () {
            // 채팅방으로 이동
          },
        ),
        // 항목 아래 디바이더
        Divider(
          height: 1,
          thickness: 1.2,
          color: MColor.kLine.normal,
        ),
      ],
    );
  }
}