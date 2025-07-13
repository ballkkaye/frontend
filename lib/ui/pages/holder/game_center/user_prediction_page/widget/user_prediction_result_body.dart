import 'package:ballkkaye_frontend/ui/pages/holder/game_center/user_prediction_page/user_prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_prediction_card_list.dart';


//경기후 승부예측 결과
class UserPredictionResultBody extends ConsumerWidget {
  const UserPredictionResultBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(userPredictionProvider);
    final vm = ref.read(userPredictionProvider.notifier);
    if (model == null) return const Center(child: CircularProgressIndicator());

    final bool isEnabled = !vm.isSubmitted;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        UserPredictionCardList(
          games: model.games,
          onSelectTeam: (_, __) {}, // 선택 불가
        ),
        SizedBox(height: 12),
        MElevatedBtn(
            text: '예측하기',
            isEnabled: isEnabled,
            onPressed: () {
              if (!isEnabled) return;
              final vm = ref.read(userPredictionProvider.notifier);
              final jsonList = vm.toJsonList();

              if (jsonList.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('예측할 팀을 선택해주세요.')),
                );
                return;
              }

              // 여기서 print로 로그 확인
              print('예측 JSON 리스트:');
              for (var item in jsonList) {
                print(
                    '  gameId: ${item["gameId"]}, userChoiceTeamId: ${item["userChoiceTeamId"]}');
              }


              // 서버 전송 실행!
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
    );
  }
}