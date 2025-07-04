import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/join_page/widgets/join_team_body.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class JoinTeamPage extends StatelessWidget {
  const JoinTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: JoinTeamBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/main-holder");
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
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
    );
  }
}
