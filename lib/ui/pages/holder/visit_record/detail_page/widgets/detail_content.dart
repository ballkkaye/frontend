import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: MText.normal6_500(
          '''
2025년 6월 22일, 사직구장에서 롯데 경기를 직관했다.
처음엔 삼성에게 6점이나 내줘서 마음이 철렁했지만, 7회 대반전이 시작되면서 분위기가 확 뒤집혔다.
김동혁과 고승민의 안타에 이어 레이예스, 전준우까지 줄줄이 적시타를 터뜨릴 때 관중석은 완전 폭발!
경기장이 진짜 들썩였고, 나도 모르게 목이 쉬도록 소리를 질렀다.
결국 9:6 대역전승! 이런 경기를 직접 봤다는 게 너무 벅차고 행복했다.
오늘 하루는 롯데 팬으로서 잊지 못할 날이다.''',
        ),
      ),
    );
  }
}
