import 'package:ballkkaye_frontend/data/model/reply.dart';
import 'package:ballkkaye_frontend/data/repository/board_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final boardDetailReplyProvider = AutoDisposeNotifierProvider.family<
    BoardDetailReplyVM, BoardDetailReplyModel?, int>(() {
  return BoardDetailReplyVM();
});

class BoardDetailReplyVM
    extends AutoDisposeFamilyNotifier<BoardDetailReplyModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  BoardDetailReplyModel? build(int boardId) {
    init(boardId);

    ref.onDispose(() {
      Logger().d("PostDetailModel 파괴됨");
    });

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

class BoardDetailReplyModel {
  List<Reply> replies;

  BoardDetailReplyModel(this.replies);

  factory BoardDetailReplyModel.fromMap(Map<String, dynamic> data) {
    return BoardDetailReplyModel(
      (data['replyItems'] as List<dynamic>)
          .map((e) => Reply.fromMap(e))
          .toList(),
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
