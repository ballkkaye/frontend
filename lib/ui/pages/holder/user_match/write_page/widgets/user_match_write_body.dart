import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/widgets/user_match_write_form.dart';
import 'package:flutter/material.dart';

class UserMatchWriteBody extends StatelessWidget {
  const UserMatchWriteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SingleChildScrollView(
        child: UserMatchWriteForm(),
      ),
    );
  }
}
