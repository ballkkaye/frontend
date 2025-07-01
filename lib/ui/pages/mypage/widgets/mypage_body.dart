import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/ui/pages/mypage/widgets/service_item.dart';
import 'package:flutter/material.dart';

class MypageBody extends StatelessWidget {
  MypageBody({
    super.key,
  });

  final List<Widget> serviceItems = [
    ServiceItem(
      icon: MIcon.page.mypage.prediction,
      label: '승리예측',
      onTap: () {
        debugPrint('승리예측 클릭');
      },
    ),
    ServiceItem(
      icon: MIcon.page.mypage.rain,
      label: '우천 취소 예측',
      onTap: () {},
    ),
    ServiceItem(
      icon: MIcon.page.mypage.record,
      label: '나의 승부 예측',
      onTap: () {},
    ),
    ServiceItem(
      icon: MIcon.page.mypage.todayGame,
      label: '오늘의 경기',
      onTap: () {},
    ),
    ServiceItem(
      icon: MIcon.page.mypage.record,
      label: '팀 순위',
      onTap: () {},
    ),
    ServiceItem(
      icon: MIcon.page.mypage.match,
      label: '동행',
      onTap: () {},
    ),
    ServiceItem(
      icon: MIcon.page.mypage.chat,
      label: '채팅',
      onTap: () {},
    ),
    ServiceItem(
      icon: MIcon.page.mypage.record,
      label: '직관기록',
      onTap: () {},
    ),
    ServiceItem(
      icon: MIcon.page.mypage.community,
      label: '커뮤니티',
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 유저 카드
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 2,
              child: ListTile(
                leading: ClipOval(
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.grey.shade300,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 21,
                        height: 21,
                        child: MIcon.page.mypage.userDummy,
                      ),
                    ),
                  ),
                ),
                title: Text('ssar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: MColor.kLabel.normal,
                      height: 1.2,
                    )),
                subtitle: Text('롯데 자이언츠',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: MColor.kLabel.neutral,
                      height: 1.2,
                    )),
                trailing: Icon(Icons.chevron_right),
                onTap: () {}, // 프로필 상세 이동
              ),
            ),

            const SizedBox(height: 10),

            // 서비스 카드
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '서비스',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 19),
                    SizedBox(
                      height: 421, // 스크롤 없게 고정
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: serviceItems.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 0),
                        itemBuilder: (context, index) => serviceItems[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
