import 'package:ballkkaye_frontend/data/model/reply.dart';
import 'package:ballkkaye_frontend/data/repository/board_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final boardDetailReplyProvider =
    AutoDisposeNotifierProvider.family<BoardDetailReplyVM, BoardDetailReplyModel?, int>(() {
  return BoardDetailReplyVM();
});

// TODO 3 : init 완성하기 (state 갱신)
class BoardDetailReplyVM extends AutoDisposeFamilyNotifier<BoardDetailReplyModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  BoardDetailReplyModel? build(int boardId) {
    // 1. 상태 초기화
    init(boardId);

    // 2. VM 파괴되는지 확인하는 이벤트
    ref.onDispose(() {
      Logger().d("PostDetailModel 파괴됨");
    });

    // 3. 상태 값 세팅
    return null;
  }

  Future<void> init(int boardId) async {
    Map<String, dynamic> data = await BoardRepository().getOne(boardId);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("댓글 상세보기 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = BoardDetailReplyModel.fromMap(data["body"]);
  }
}

// TODO 2 : replies 빼고 상태로 관리하기
class BoardDetailReplyModel {
  List<Reply> replies;

  BoardDetailReplyModel(this.replies);

  factory BoardDetailReplyModel.fromMap(Map<String, dynamic> data) {
    return BoardDetailReplyModel(
      (data['replyItems'] as List<dynamic>).map((e) => Reply.fromMap(e)).toList(),
    );
  }

  BoardDetailReplyModel copyWith({
    List<Reply>? replies,
  }) {
    return BoardDetailReplyModel(replies ?? this.replies);
  }

  @override
  String toString() {
    return 'PostDetailModel(replies: $replies)';
  }
}
