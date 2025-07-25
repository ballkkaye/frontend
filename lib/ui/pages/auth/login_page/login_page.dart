import 'package:ballkkaye_frontend/ui/pages/auth/login_page/widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     // Navigator.pushNamed(context, "/join/nickname");
      //     try {
      //       throw StateError('Sentry Test Exception');
      //     } catch (exception, stackTrace) {
      //       await Sentry.captureException(
      //         exception,
      //         stackTrace: stackTrace,
      //       );
      //     }
      //   },
      // ),
    );
  }
}
