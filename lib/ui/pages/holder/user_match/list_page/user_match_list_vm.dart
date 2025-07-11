import 'package:ballkkaye_frontend/data/enum/age.dart';
import 'package:ballkkaye_frontend/data/enum/gender.dart';
import 'package:ballkkaye_frontend/data/model/user_match.dart';
import 'package:ballkkaye_frontend/data/repository/user_match_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/user_match_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/user_match_write_fm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final userMatchListProvider = AutoDisposeNotifierProvider<UserMatchListVM, UserMatchListModel?>(() {
  return UserMatchListVM();
});

class UserMatchListVM extends AutoDisposeNotifier<UserMatchListModel?> {
  final mContext = navigatorKey.currentContext!;
  final refreshCtrl = RefreshController();

  @override
  UserMatchListModel? build() {
    // 1. 상태 초기화
    init();

    // 2. VM 파괴되는지 확인하는 이벤트
    ref.onDispose(() {
      Logger().d("UserUpdateTeamVM 파괴됨");
    });

    // 3. 상태 값 세팅
    return null;
  }

  Future<void> init({int? page}) async {
    Map<String, dynamic> data = await UserMatchRepository().getList(
      page: page,
    );
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("동행글 전체 목록 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = UserMatchListModel.fromMap(data['body']);

    refreshCtrl.refreshCompleted();
  }

  // 드롭다운버튼으로 조건부 조회
  Future<void> fetchList({
    int? page,
    Gender? gender,
    Age? age,
    int? teamId,
  }) async {
    Logger().d('📩 fetchList() called with => '
        'page: $page, '
        'gender: ${gender?.label}, '
        'age: ${age?.label}, '
        'teamId: $teamId');

    Map<String, dynamic> data = await UserMatchRepository().getListByQuery(
      page: page,
      gender: gender?.label,
      age: age?.label,
      teamId: teamId,
    );

    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("동행글 조건부 목록 통신 실패 : ${data["msg"]}")),
      );
      return;
    }

    state = UserMatchListModel.fromMap(data['body']);
  }

  Future<void> write(UserMatchWriteModel model) async {
    Logger().d("글쓰기 요청 : ${model.toMap()}");

    Map<String, dynamic> data = await UserMatchRepository().write(model.toMap());

    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("동행글 쓰기 실패 : ${data["msg"]}")),
      );
      return;
    }

    final newMatch = UserMatch.fromMap(data["body"]["match"]);

    List<UserMatch> nextMatches = [newMatch, ...?state?.userMatches];

    state = state?.copyWith(userMatches: nextMatches) ??
        UserMatchListModel(null, null, null, null, [newMatch]);

    Navigator.pop(mContext);
    Navigator.push(
        mContext, MaterialPageRoute(builder: (context) => UserMatchDetailPage(newMatch.matchId!)));
  }
}

// List 형태
class UserMatchListModel {
  String? selectedGender;
  String? selectedAge;
  int? selectedTeamId;
  String? selectedTimeName;
  List<UserMatch> userMatches;

  UserMatchListModel(
    this.selectedGender,
    this.selectedAge,
    this.selectedTeamId,
    this.selectedTimeName,
    this.userMatches,
  );

  UserMatchListModel.fromMap(Map<String, dynamic> data)
      : selectedGender = data['selectedGender'],
        selectedAge = data['selectedAge'],
        selectedTeamId = data['selectedTeamId'],
        selectedTimeName = data['selectedTimeName'],
        userMatches = (data['matches'] as List).map((e) => UserMatch.fromMap(e)).toList();

  UserMatchListModel copyWith({
    String? selectedGender,
    String? selectedAge,
    int? selectedTeamId,
    String? selectedTimeName,
    List<UserMatch>? userMatches,
  }) {
    return UserMatchListModel(
      selectedGender ?? this.selectedGender,
      selectedAge ?? this.selectedAge,
      selectedTeamId ?? this.selectedTeamId,
      selectedTimeName ?? this.selectedTimeName,
      userMatches ?? this.userMatches,
    );
  }

  @override
  String toString() {
    return 'UserMatchListModel{selectedGender: $selectedGender, selectedAge: $selectedAge, selectedTeamId: $selectedTeamId, selectedTimeName: $selectedTimeName, userMatches: $userMatches}';
  }
}
