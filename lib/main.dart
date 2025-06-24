import 'package:ballkkaye_frontend/ui/pages/auth/join_page/join_page.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/login_page/login_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/home_page.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/main_holder.dart';
import 'package:ballkkaye_frontend/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {
        "/join": (context) => const JoinPage(),
        "/login": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
        "/main-holder": (context) => MainHolder(),
      },
    );
  }
}