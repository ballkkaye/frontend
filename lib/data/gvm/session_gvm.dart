import 'package:ballkkaye_frontend/_core/utils/m_device.dart';
import 'package:ballkkaye_frontend/_core/utils/m_http.dart';
import 'package:ballkkaye_frontend/data/model/user.dart';
import 'package:ballkkaye_frontend/data/repository/user_repository.dart';
import 'package:ballkkaye_frontend/main.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/join_page/join_fm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sessionProvider = NotifierProvider<SessionGVM, SessionModel>(() {
  return SessionGVM();
});

class SessionGVM extends Notifier<SessionModel> {
  final mContext = navigatorKey.currentContext!;
  @override
  SessionModel build() {
    return SessionModel(); // isLogin = false, 그 외 = null로 초기화
  }

  Future<void> oauthLogin(String accessToken) async {
    // 1. 유효성 검사 (oauth 로그인 생략)

    // 2. 통신
    Map<String, dynamic> data = await UserRepository().oauthLogin(accessToken);
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("${data["msg"]}")),
      );
      return;
    }

    // 3. 파싱
    User user = User.fromMap(data["body"]);

    // 4. 토큰 디바이스 저장 -> 자동 로그인 가능
    await saveAccessToken(user.accessToken);

    // 5. 세션 모델 갱신 (현재 isLogin = false 상태)
    state = SessionModel.fromMap(data["body"]);

    // 6. dio의 header에 토큰 세팅 (Bearer 붙어 있음)
    dio.options.headers["Authorization"] = user.accessToken;

    // 7. 메인 홀더 (홈) 페이지 이동
    if (user.isNewUser!) {
      Navigator.pushNamed(mContext, "/join/nickname");
    } else {
      Navigator.pushNamed(mContext, "/main-holder");
    }
  }

  Future<void> logout() async {
    // 1. 토큰 디바이스 제거
    await deleteAccessToken;

    // 2. 세션 모델 초기화
    state = SessionModel();

    // 3. dio 세팅 제거
    dio.options.headers["Authorization"] = "";

    // 4. login 페이지 이동
    Navigator.pushNamedAndRemoveUntil(mContext, "/login", (route) => false);
  }

  Future<void> writeAdditionalInfo(JoinModel model) async {
    // 1. 유효성 검사

    // 2. 통신
    Map<String, dynamic> data = await UserRepository().writeAdditionalInfo(model.toMap());
    if (data["status"] != 200) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("${data["msg"]}")),
      );
      return;
    }

    // 3. 파싱
    User user = User.fromMap(data["body"]);

    // 4. 토큰 디바이스 저장 -> 자동 로그인 가능
    await saveAccessToken(user.accessToken);

    // 5. 세션 모델 갱신 (현재 isLogin = false 상태)
    state = SessionModel.fromMap(data["body"]);

    // 6. dio의 header에 토큰 세팅 (Bearer 붙어 있음)
    dio.options.headers["Authorization"] = user.accessToken;

    // 7. 페이지 이동
    Navigator.pushNamed(mContext, "/main-holder");
  }
}

/// 3. 창고 데이터 타입
class SessionModel {
  User? user;
  bool? isLogin;

  // 생성자
  SessionModel({this.user, this.isLogin = false});

  // fromMap
  SessionModel.fromMap(Map<String, dynamic> data)
      : user = User.fromMap(data),
        isLogin = true;

  // copyWith : 화면 갱신X -> 생성X

  // toString
  @override
  String toString() {
    return 'SessionModel{user: $user, isLogin: $isLogin}';
  }
}
