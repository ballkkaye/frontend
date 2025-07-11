import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_card_list.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPredictionBody extends ConsumerWidget {
  const UserPredictionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(userPredictionProvider);

    if (model == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 22,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              UserPredictionCardList(games: model.games),
              SizedBox(height: 12),
              MElevatedBtn(
                text: '예측하기',
                isEnabled: true,
                onPressed: () {}, //isEnabled = false
              ),
            ],
          ),
        ),
      ],
    );
  }
}
