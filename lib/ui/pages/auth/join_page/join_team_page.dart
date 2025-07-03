import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_dropdown_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class JoinTeamPage extends StatelessWidget {
  const JoinTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> teams = [
      'SSG 랜더스',
      '키움 히어로즈',
      'LG 트윈스',
      'KT 위즈',
      'NC 다이노스',
      'KIA 타이거즈',
      '롯데 자이언츠',
      '삼성 라이온즈',
      '두산 베어스',
      '한화 이글스',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedSmoothIndicator(
          activeIndex: 1,
          count: 2,
          effect: ExpandingDotsEffect(
            expansionFactor: 3,
            dotHeight: 8,
            dotWidth: 8,
            spacing: 6,
            dotColor: Colors.grey,
            activeDotColor: MColor.kPrimary.strong,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.directional(
          top: 50,
          bottom: 20,
          start: 16,
          end: 16,
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MText.h3_6('응원팀을 선택해주세요', color: MColor.kLabel.normal),
              SizedBox(height: 12),
              MDropdownBtn(
                hintText: '응원팀 선택',
                items: teams,
                onChanged: (value) {},
              ),
              Spacer(),
              MElevatedBtn(
                text: '완료',
                onPressed: () {
                  Navigator.pushNamed(context, "/main-holder");
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/main-holder");
        },
      ),
    );
  }
}
