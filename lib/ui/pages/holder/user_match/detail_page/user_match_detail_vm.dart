import 'package:ballkkaye_frontend/data/model/user_match.dart';
import 'package:ballkkaye_frontend/data/repository/user_match_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final UserMatchDetailProvider =
    AutoDisposeNotifierProvider.family<UserMatchDetailVM, UserMatchDetailModel?, int>(() {
  return UserMatchDetailVM();
});

class UserMatchDetailVM extends AutoDisposeFamilyNotifier<UserMatchDetailModel?, int> {
  final mContext = navigatorKey.currentContext!;

  @override
  UserMatchDetailModel? build(int userMatchId) {
    // 1. 상태 초기화
    init(userMatchId);

    // 2. VM 파괴되는지 확인하는 이벤트
    ref.onDispose(() {
      Logger().d("UserMatchDetailVM 파괴됨");
    });

    // 3. 상태 값 세팅
    return null;
  }

  Future<void> init(int postId) async {
    Map<String, dynamic> data = await UserMatchRepository().getOne(postId);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("동행 상세보기 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = UserMatchDetailModel.fromMap(data["body"]);
  }
}

class UserMatchDetailModel {
  UserMatch userMatch;

  UserMatchDetailModel(this.userMatch);

  UserMatchDetailModel.fromMap(Map<String, dynamic> data) : userMatch = UserMatch.fromMap(data);

  UserMatchDetailModel copyWith(UserMatch? userMatch) {
    return UserMatchDetailModel(userMatch ?? this.userMatch);
  }
}
