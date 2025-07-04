import 'package:ballkkaye_frontend/ui/pages/mypage/user/update_page/widgets/user_update_form.dart';
import 'package:flutter/material.dart';

class UserUpdateBody extends StatelessWidget {
  const UserUpdateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.directional(start: 16, end: 16, bottom: 20),
      child: UserUpdateForm(),
    );
  }
}
