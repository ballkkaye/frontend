import 'package:logger/logger.dart';

class ChatRoomRepository {
  // 채팅방 상세 = 채팅 목록
  Future<Map<String, dynamic>> getOne(int chatRoomId) async {
    // Response response = await dio.get("/s/api/chatrooms/${chatRoomId}/messages");
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": [
        {
          "messageId": 17,
          "senderId": 2,
          "senderName": "cos",
          "message": "메세지17",
          "messageType": "TALK",
          "isOwner": false,
          "createdAt": "2025-07-10T02:48:57.882+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 16,
          "senderId": 1,
          "senderName": "ssar",
          "message": "메세지16",
          "messageType": "TALK",
          "isOwner": true,
          "createdAt": "2025-07-10T02:48:56.572+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 15,
          "senderId": 2,
          "senderName": "cos",
          "message": "메세지15",
          "messageType": "TALK",
          "isOwner": false,
          "createdAt": "2025-07-10T02:48:52.517+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 14,
          "senderId": 1,
          "senderName": "ssar",
          "message": "메세지14",
          "messageType": "TALK",
          "isOwner": true,
          "createdAt": "2025-07-09T02:48:51.237+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 13,
          "senderId": 1,
          "senderName": "ssar",
          "message": "메세지13",
          "messageType": "TALK",
          "isOwner": true,
          "createdAt": "2025-07-09T02:48:50.454+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 12,
          "senderId": 2,
          "senderName": "cos",
          "message": "메세지12",
          "messageType": "TALK",
          "isOwner": false,
          "createdAt": "2025-07-09T02:48:49.105+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 11,
          "senderId": 2,
          "senderName": "cos",
          "message": "메세지11",
          "messageType": "TALK",
          "isOwner": false,
          "createdAt": "2025-07-09T02:48:48.186+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 10,
          "senderId": 2,
          "senderName": "cos",
          "message": "메세지10",
          "messageType": "TALK",
          "isOwner": false,
          "createdAt": "2025-07-08T02:48:47.360+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 9,
          "senderId": 2,
          "senderName": "cos",
          "message": "메세지9",
          "messageType": "TALK",
          "isOwner": false,
          "createdAt": "2025-07-08T02:48:46.594+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 8,
          "senderId": 2,
          "senderName": "cos",
          "message": "메세지8",
          "messageType": "TALK",
          "isOwner": false,
          "createdAt": "2025-07-08T02:48:45.753+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 7,
          "senderId": 2,
          "senderName": "cos",
          "message": "cos님이 입장하셨습니다.",
          "messageType": "ENTER",
          "isOwner": false,
          "createdAt": "2025-07-08T02:48:39.831+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 6,
          "senderId": 1,
          "senderName": "ssar",
          "message": "메세지6",
          "messageType": "TALK",
          "isOwner": true,
          "createdAt": "2025-07-07T02:48:24.495+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 5,
          "senderId": 1,
          "senderName": "ssar",
          "message": "메세지5",
          "messageType": "TALK",
          "isOwner": true,
          "createdAt": "2025-07-07T02:48:23.746+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 4,
          "senderId": 1,
          "senderName": "ssar",
          "message": "메세지4",
          "messageType": "TALK",
          "isOwner": true,
          "createdAt": "2025-07-07T02:48:23.062+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 3,
          "senderId": 1,
          "senderName": "ssar",
          "message": "메세지3",
          "messageType": "TALK",
          "isOwner": true,
          "createdAt": "2025-07-06T02:48:22.073+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 2,
          "senderId": 1,
          "senderName": "ssar",
          "message": "메세지2",
          "messageType": "TALK",
          "isOwner": true,
          "createdAt": "2025-07-06T02:48:21.437+00:00",
          "chatRoomId": 1
        },
        {
          "messageId": 1,
          "senderId": 1,
          "senderName": "ssar",
          "message": "메세지1",
          "messageType": "TALK",
          "isOwner": true,
          "createdAt": "2025-07-06T02:48:20.764+00:00",
          "chatRoomId": 1
        }
      ]
    };
    Logger().d('ChatRoomRepository getOne: ${responseBody}');
    return responseBody;
  }

  // 채팅방 퇴장
  Future<Map<String, dynamic>> exit(int userId) async {
    // Response response = await dio.delete("/s/api/chatrooms/user/$userId");
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {"deleteStatus": "삭제됨"}
    };

    Logger().d('ChatRoomRepository getOne: ${responseBody}');
    return responseBody;
  }

  // 채팅방 삭제
  Future<Map<String, dynamic>> deleteOne(int chatRoomId) async {
    // Response response = await dio.delete("/s/api/chatrooms/$chatRoomId");
    // final responseBody = response.data;
    final responseBody = {
      "status": 200,
      "msg": "성공",
      "body": {"deleteStatus": "DELETED"}
    };

    Logger().d('ChatRoomRepository deleteOne: ${responseBody}');
    return responseBody;
  }
}
