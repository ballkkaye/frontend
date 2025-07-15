import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_card_list.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPredictionBody extends ConsumerWidget {
  final UserPredictionState state;

  const UserPredictionBody({super.key, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(userPredictionProvider.notifier);
    final fm = ref.read(userPredictionFProvider.notifier);

    final games = switch (state) {
      BeforePrediction(:final games) => games,
      AfterPrediction(:final games) => games,
    };

    final isSubmitted = state is AfterPrediction;

    return ListView(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 22, bottom: 22, left: 16, right: 16),
          child: Column(
            children: [
              UserPredictionCardList(
                games: games,
                onSelectTeam: fm.selectTeam,
                isResult: isSubmitted,
              ),
              const SizedBox(height: 12),
              if (!isSubmitted)
                MElevatedBtn(
                  text: '예측하기',
                  isEnabled: true,
                  onPressed: () async {
                    final predictions = fm.toMapList();

                    try {
                      await vm.submitPredictions(predictions);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('예측 실패: $e')),
                      );
                    }
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
