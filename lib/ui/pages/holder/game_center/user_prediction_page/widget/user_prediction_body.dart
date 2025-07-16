import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_fm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/widget/user_prediction_card_list.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPredictionBody extends ConsumerWidget {
  // 경기 예측 단계인지(true) 결과를 보여주는 단계인지(false)를 나타내는 플래그
  final bool isPredictionPhase;

  const UserPredictionBody({
    super.key,
    required this.isPredictionPhase,
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

    final bool isEnabled = isPredictionPhase;

    return SmartRefresher(
      controller: vm.refreshCtrl,
      enablePullUp: false,
      enablePullDown: true,
      onRefresh: () {
        Logger().d("새로고침 시도");
        vm.init();
      },
      child: ListView(
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
                  onSelectTeam: isPredictionPhase ? fm.selectTeam : (_, __) {},
                ),
                const SizedBox(height: 12),
                if (isPredictionPhase)
                  MElevatedBtn(
                    text: '예측하기',
                    isEnabled: isEnabled,
                    onPressed: () {
                      if (!isEnabled) return;

                      vm.submitPredictions(fModel);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
