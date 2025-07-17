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
          final item = model.groupedChatList[index];

          if (item is String) {
            final date = DateTime.tryParse(item);
            if (date != null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MText.normal6_7(
                    "${date.year}년 ${date.month.toString().padLeft(2, '0')}월 ${date.day.toString().padLeft(2, '0')}일",
                    color: MColor.kLabel.normal,
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }

          if (item is ChatRoom && item.chat != null) {
            final chat = item.chat!;
            final isTALK = chat.messageType == 'TALK';

            if (!isTALK) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    chat.message,
                    style: TextStyle(
                      color: MColor.kLabel.neutral,
                      fontSize: 12,
                    ),
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: chat.isOwner ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  if (!chat.isOwner) ...[
                    ChatRoomDetailMessageProfile(), // 프로필 이미지 등
                    const SizedBox(width: 10),
                  ],
                  ChatRoomDetailMessageBubble(chat),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      );
    }
  }
}
