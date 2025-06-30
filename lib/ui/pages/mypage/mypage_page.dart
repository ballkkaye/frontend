import 'package:flutter/material.dart';

class MypagePage extends StatelessWidget {
  final List<_ServiceItem> services = [
    _ServiceItem(Icons.check_circle, '승리예측'),
    _ServiceItem(Icons.umbrella, '우천 취소 예측'),
    _ServiceItem(Icons.local_fire_department, '나의 승부 예측'),
    _ServiceItem(Icons.emoji_events, '오늘의 경기'),
    _ServiceItem(Icons.military_tech, '팀 순위'),
    _ServiceItem(Icons.group, '동행'),
    _ServiceItem(Icons.chat, '채팅'),
    _ServiceItem(Icons.book, '직관기록'),
    _ServiceItem(Icons.forum, '커뮤니티'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('마이페이지', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              // 유저 카드
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(Icons.person, color: Colors.grey),
                  ),
                  title: Text('ssar', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('롯데 자이언츠'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {}, // 프로필 상세 이동
                ),
              ),

              const SizedBox(height: 16),

              // 서비스 카드
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Align(
                        child: Row(
                          children: [
                            Text(
                              '서비스',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          double itemWidth = (constraints.maxWidth - 24) / 2;
                          return Wrap(
                            spacing: 24,
                            runSpacing: 16,
                            children: services.map((item) {
                              return SizedBox(
                                width: itemWidth,
                                child: Row(
                                  children: [
                                    Icon(item.icon, color: Colors.teal),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(item.label),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceItem {
  final IconData icon;
  final String label;

  _ServiceItem(this.icon, this.label);
}
