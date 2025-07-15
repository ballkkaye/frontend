import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/chat_room.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/chat_room_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/widgets/chat_room_leave_btn.dart';
import 'package:flutter/material.dart';

class ChatRoomListItem extends StatelessWidget {
  final ChatRoom chatRoom;

  const ChatRoomListItem({
    super.key,
    required this.chatRoom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 12),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: List.generate(
                (chatRoom.users.length > 4 ? 4 : chatRoom.users.length),
                (index) {
                  final user = chatRoom.users[index];

                  // 위치 (0: topLeft, 1: topRight, 2: bottomLeft, 3: bottomRight)
                  double spacing = 3.0;
                  double size = 23;

                  double top = (index ~/ 2 == 0) ? 0 : size + spacing;
                  double left = (index % 2 == 0) ? 0 : size + spacing;

                  return Positioned(
                    top: top,
                    left: left,
                    child: ClipOval(
                      child: Image.network(
                        user.profileUrl ?? '',
                        width: size,
                        height: size,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: size,
                          height: size,
                          color: Colors.grey.shade300,
                          child: MIcon.page.mypage.userDummy,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          title: MText.normal5_6(
            '${chatRoom.chatRoomTitle}',
            color: MColor.kLabel.normal,
          ),
          subtitle: Row(
            children: [
              Text(
                '${chatRoom.content}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: MColor.kLabel.neutral),
              ),
              MText.label3(
                ' • ${chatRoom.relativeTime}',
                color: MColor.kLabel.neutral,
              )
            ],
          ),
          //TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: color)
          trailing: ChatRoomLeaveBtn(
            icon: MIcon.nav.top.dotVertical,
            onConfirm: () {
              print("list에서 채팅방 나감");
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ChatRoomDetailPage(chatRoom.chatRoomId)),
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
