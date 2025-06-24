import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            _ProgressIndicator(currentPage: 1),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  final int currentPage;

  const _ProgressIndicator({required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        bool isActive = index == currentPage;

        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? MColor.kPrimary.strong : MColor.kFill.normal,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
