import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/chat_room_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/widgets/chat_room_leave_btn.dart';
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
          contentPadding: EdgeInsets.only(left: 12),
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
          title: MText.normal5_600(
            chat['name']!,
            color: MColor.kLabel.normal,
          ),
          subtitle: MText.label3(
            chat['time']!,
            color: MColor.kLabel.neutral,
          ),
          trailing: ChatRoomLeaveBtn(
            icon: MIcon.nav.top.dotVertical,
            onConfirm: () {
              print("list에서 채팅방 나감");
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ChatRoomDetailPage()),
            );
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
