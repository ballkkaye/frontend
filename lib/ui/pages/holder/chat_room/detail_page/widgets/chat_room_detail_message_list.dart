import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/chat_room.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/chat_room_detail_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/chat_room_detail_message_bubble.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/widgets/chat_room_detail_message_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatRoomDetailMessageList extends ConsumerWidget {
  int chatRoomId;

  ChatRoomDetailMessageList(this.chatRoomId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChatRoomDetailModel? model = ref.watch(chatRoomDetailProvider(chatRoomId));

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: model.groupedChatList.length,
        itemBuilder: (context, index) {
          if (model.groupedChatList[index] is String) {
            // 날짜 헤더
            final date = DateTime.parse(model.groupedChatList[index]);
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: MText.normal6_7(
                  "${date.year}년 ${date.month.toString().padLeft(2, '0')}월 ${date.day.toString().padLeft(2, '0')}일",
                  color: MColor.kLabel.normal,
                ),
              ),
            );
          } else if (model.groupedChatList[index] is ChatRoom) {
            if (model.groupedChatList[index].chat.messageType != 'TALK') {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    model.groupedChatList[index].chat.message,
                    style: TextStyle(
                      color: MColor.kLabel.neutral,
                      fontSize: 12,
                    ),
                  ),
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: model.groupedChatList[index].chat.isOwner
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  if (!model.groupedChatList[index].chat.isOwner) ...[
                    ChatRoomDetailMessageProfile(), //userProfileImg: item.chat.user.profileUrl!
                    SizedBox(width: 10),
                  ],
                  ChatRoomDetailMessageBubble(model.groupedChatList[index].chat),
                ],
              ),
            );
          }

          return SizedBox.shrink();
        },
      );
    }
  }
}
