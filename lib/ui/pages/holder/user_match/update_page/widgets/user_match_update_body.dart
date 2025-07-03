import 'package:ballkkaye_frontend/ui/pages/holder/user_match/update_page/widgets/user_match_update_form.dart';
import 'package:flutter/material.dart';

class UserMatchUpdateBody extends StatelessWidget {
  const UserMatchUpdateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SingleChildScrollView(
        child: UserMatchUpdateForm(),
      ),
    );
  }
}
