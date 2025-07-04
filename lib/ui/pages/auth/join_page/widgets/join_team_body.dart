import 'package:ballkkaye_frontend/ui/pages/auth/join_page/widgets/join_team_form.dart';
import 'package:flutter/material.dart';

class JoinTeamBody extends StatelessWidget {
  const JoinTeamBody({
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
      child: JoinTeamForm(),
    );
  }
}
