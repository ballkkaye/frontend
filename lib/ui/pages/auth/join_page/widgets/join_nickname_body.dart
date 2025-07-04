import 'package:ballkkaye_frontend/ui/pages/auth/join_page/widgets/join_nickname_form.dart';
import 'package:flutter/material.dart';

class JoinNicknameBody extends StatelessWidget {
  const JoinNicknameBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.directional(
        top: 50,
        bottom: 20,
        start: 16,
        end: 16,
      ),
      child: JoinNicknameForm(),
    );
  }
}
