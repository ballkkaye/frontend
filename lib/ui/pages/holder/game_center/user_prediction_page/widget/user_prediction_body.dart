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

    if (model == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // 예측 완료되었으면 버튼 비활성화
    final bool isEnabled = !vm.isSubmitted;
    final games = model.games.map((g) => g.game).toList();
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
              SizedBox(height: 12),
              MElevatedBtn(
                  text: '예측하기',
                  isEnabled: isEnabled,
                  onPressed: () {
                    if (!isEnabled) return;
                    final predictions = fm.toGameList(games);

                    if (predictions.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('예측할 팀을 선택해주세요W.')),
                      );
                      return;
                    }

                    // 💾 현재 예측 상태 로컬에 저장
                    vm.setPredictions(predictions);

                    // 🔄 서버에 예측 전송 → 상태 갱신
                    vm.submitPredictions().then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('예측이 완료되었습니다.')),
                      );

                      // TODO: 서버에 전송하는 API 호출 넣기
                    });
                  }
                  //isEnabled = false
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
