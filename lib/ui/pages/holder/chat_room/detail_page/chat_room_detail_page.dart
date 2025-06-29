import 'package:flutter/material.dart';

class ChatRoomDetailPage extends StatelessWidget {
  final List<Map<String, String>> chatRooms = [
    {'name': '채팅방이름', 'time': '15분전'},
    {'name': '채팅방이름', 'time': '16분전'},
    {'name': '채팅방이름', 'time': '15분전'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        itemCount: chatRooms.length,
        separatorBuilder: (_, __) => Divider(height: 1),
        itemBuilder: (context, index) {
          final chat = chatRooms[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.person, color: Colors.black54),
            ),
            title: Text(chat['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(chat['time']!),
            trailing: Icon(Icons.more_vert),
            onTap: () {
              // 채팅방으로 이동하는 코드 작성 예정
            },
          );
        },
      ),
    );
  }
}