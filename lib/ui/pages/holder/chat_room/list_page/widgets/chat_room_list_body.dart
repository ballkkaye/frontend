import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/list_page/chat_room_list_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/list_page/widgets/char_room_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatRoomListBody extends ConsumerWidget {
  ChatRoomListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChatRoomListModel? model = ref.watch(chatRoomListProvider);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Column(
        children: [
          // 상단 디바이더
          Divider(height: 1, color: MColor.kLine.normal),

          Expanded(
            child: ListView.builder(
              itemCount: model.chatRooms.length,
              itemBuilder: (context, index) {
                return ChatRoomListItem(chatRoom: model.chatRooms[index]);
              },
            ),
          ),
        ],
      );
    }
  }
}
