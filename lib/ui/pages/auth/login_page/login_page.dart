import 'package:ballkkaye_frontend/ui/pages/auth/login_page/widget/login_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, "/main-holder");
      }),
    );
  }
}
