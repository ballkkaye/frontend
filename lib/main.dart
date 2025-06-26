import 'package:ballkkaye_frontend/_core/style/m_theme.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/join_page/join_page.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/login_page/login_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/matchup_page/matchup_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/rainout_prediction_page/rainout_prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/ranking_page/ranking_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/today_game_page/today_game_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/home_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/main_holder.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/detail_page/visit_record_detail_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/visit_record/write_page/visit_record_write_page.dart';
import 'package:ballkkaye_frontend/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: mTheme(),
      home: SplashPage(),
      routes: {
        "/join": (context) => const JoinPage(),
        "/login": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
        "/mainholder": (context) => MainHolder(),
        "/visitrecord/write": (context) => const VisitRecordWritePage(),
        "/visitrecord/detail": (context) => const VisitRecordDetailPage(),
        "/game_center/matchup": (context) => const MatchupPage(),
        "/game_center/prediction": (context) => const PredictionPage(),
        "/game_center/rainout_prediction": (context) => const RainoutPredictionPage(),
        "/game_center/ranking": (context) => const RankingPage(),
        "/game_center/today_game": (context) => const TodayGamePage(),
        "/game_center/user_prediction": (context) => const UserPredictionPage(),
      },
    );
  }
}
