import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_fm.dart';
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
    final vm = ref.read(userPredictionProvider.notifier);
    final fm = ref.read(userPredictionFProvider.notifier);
    final fModel = ref.watch(userPredictionFProvider);

    if (model == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // 예측하기 버튼 활성화 여부를 결정
    final bool isEnabled = !vm.isSubmitted;

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
              UserPredictionCardList(
                games: model.games,
                onSelectTeam: fm.selectTeam,
              ),
              const SizedBox(height: 12),
              MElevatedBtn(
                text: '예측하기',
                isEnabled: isEnabled,
                onPressed: () {
                  // 버튼 비활성화 상태일 경우 동작X.
                  if (!isEnabled) return;

                  vm.submitPredictions(fModel);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
