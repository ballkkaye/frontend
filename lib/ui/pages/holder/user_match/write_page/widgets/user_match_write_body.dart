import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/write_page/widgets/user_match_write_form.dart';
import 'package:flutter/material.dart';

class UserMatchWriteBody extends StatelessWidget {
  Game selectedGame;

  UserMatchWriteBody({super.key, required this.selectedGame});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SingleChildScrollView(
        child: UserMatchWriteForm(selectedGame: selectedGame),
      ),
    );
  }
}
