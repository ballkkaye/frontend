import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_elevated_btn.dart';
import 'package:ballkkaye_frontend/ui/widgets/m_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class JoinNicknamePage extends StatelessWidget {
  const JoinNicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedSmoothIndicator(
          activeIndex: 0,
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
              MText.h3_6('닉네임을 입력해주세요', color: MColor.kLabel.normal),
              SizedBox(height: 12),
              MTextFormField(
                hintText: '닉네임',
                onChanged: (p0) {},
              ),
              Spacer(),
              MElevatedBtn(
                text: '다음',
                onPressed: () {
                  Navigator.pushNamed(context, "/join/team");
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/join/team");
        },
      ),
    );
  }
}
