import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/_core/utils/m_socket.dart';
import 'package:ballkkaye_frontend/data/model/user_match.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/chat_room_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class UserMatchDetailActionBar extends ConsumerWidget {
  final UserMatch userMatch;

  const UserMatchDetailActionBar(this.userMatch, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MIcon.page.userMatch.like,
        Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end, //
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 2), //
              child: Text(
                '현재 ${userMatch.participationInfo}명 참여중',
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: MColor.kLabel.alternative),
              ),
            ),
            SizedBox(width: 12.5),
            ElevatedButton(
              onPressed: () {
                Logger().d(userMatch.chatRoomId);
                // 웹소켓 연결
                MSocket(ref).connectWebSocket(userMatch.chatRoomId!);
                Logger().d("웹소켓 연결됨");
                // 채팅 방으로 이동
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatRoomDetailPage(userMatch.chatRoomId!)));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MColor.kPrimary.strong,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 21),
              ),
              child: MText.button1('채팅하기', color: MColor.kLabel.white),
            ),
          ],
        ),
      ],
    );
  }
}
