import 'package:ballkkaye_frontend/_core/style/m_theme.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/join_page/join_nickname_page.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/join_page/join_team_page.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/login_page/login_page.dart';
import 'package:ballkkaye_frontend/ui/pages/board/detail_page/board_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/board/list_page/board_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/board/update_page/board_update_page.dart';
import 'package:ballkkaye_frontend/ui/pages/board/write_page/board_write_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/detail_page/chat_room_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/chat_room/list_page/chat_room_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/matchup_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/rainout_prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/ranking_page/ranking_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/today_game_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/home_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/main_holder.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/user_match_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/list_page/user_match_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/select_page/user_match_select_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/update_page/user_match_update_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/user_match_write_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/visit_record_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/list_page/visit_record_list_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/select_page/visit_record_select_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/update_page/visit_record_update_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/visit_record_write_page.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/mypage_page.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/detail_page/user_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/user/update_page/user_update_page.dart';
import 'package:ballkkaye_frontend/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  //print("Current Directory: ${Directory.current.path}");
  //await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initializeDateFormatting();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', ''),
      ],
      theme: mTheme(),
      home: SplashPage(),
      routes: {
        "/login": (context) => const LoginPage(),
        "/join/nickname": (context) => const JoinNicknamePage(),
        "/join/team": (context) => const JoinTeamPage(),
        "/home": (context) => const HomePage(),
        "/main-holder": (context) => MainHolder(),
        "/visit-record/list": (context) => const VisitRecordListPage(),
        "/visit-record/detail": (context) => const VisitRecordDetailPage(visitRecordId: 10),
        "/visit-record/select": (context) => VisitRecordSelectPage(),
        "/visit-record/write": (context) => const VisitRecordWritePage(),
        "/visit-record/update": (context) => const VisitRecordUpdatePage(),
        "/game-center/matchup": (context) => const MatchupPage(),
        "/game-center/prediction": (context) => const PredictionPage(),
        "/game-center/rainout-prediction": (context) => const RainoutPredictionPage(),
        "/game-center/ranking": (context) => const RankingPage(),
        "/game-center/today-game": (context) => const TodayGamePage(),
        "/game-center/user-prediction": (context) => const UserPredictionPage(),
        "/board/list": (context) => const BoardListPage(),
        "/board/detail": (context) => BoardDetailPage(1), //todo 나중에 리스트에서 받은값 전달하기
        "/board/write": (context) => const BoardWritePage(),
        "/board/update": (context) => const BoardUpdatePage(),
        "/user-match/update": (context) => const UserMatchUpdatePage(),
        "/user-match/write": (context) => const UserMatchWritePage(),
        "/user-match/detail": (context) => UserMatchDetailPage(1),
        "/user-match/list": (context) => const UserMatchListPage(),
        "/user-match/select": (context) => const UserMatchSelectPage(),
        "/user/detail": (context) => const UserDetailPage(),
        "/user/update": (context) => const UserUpdatePage(),
        "/mypage": (context) => const MypagePage(),
        "/chat-room/list": (context) => const ChatRoomListPage(),
        "/chat-room/detail": (context) => const ChatRoomDetailPage(),
      },
    );
  }
}
