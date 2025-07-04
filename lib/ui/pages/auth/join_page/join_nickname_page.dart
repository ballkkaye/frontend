import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/join_page/widgets/join_nickname_body.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class JoinNicknamePage extends StatelessWidget {
  const JoinNicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: JoinNicknameBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/join/team");
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
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
    );
  }
}
