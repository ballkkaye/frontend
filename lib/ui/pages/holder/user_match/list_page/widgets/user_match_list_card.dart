import 'package:ballkkaye_frontend/ui/pages/holder/user_match/detail_page/user_match_detail_page.dart';
import 'package:flutter/material.dart';

class UserMatchListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      clipBehavior: Clip.hardEdge, // 중요! ripple overflow 방지
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UserMatchDetailPage()),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 경기 정보 + 작성 시간
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("롯데 자이언츠 vs 두산 베어스", style: TextStyle(color: Colors.grey[600])),
                  Text("15분전", style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 6),
              // 제목
              Text("직관같이갑시다", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 8),
              // 태그들
              Wrap(
                spacing: 8,
                children: [
                  _tag("여성"),
                  _tag("20대 이상"),
                  _tag("롯데 자이언츠"),
                ],
              ),
              SizedBox(height: 10),
              // 같은 팀 선호 여부
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  true
                      ? Row(
                          children: [
                            Icon(Icons.check_box, size: 16, color: Colors.teal),
                            SizedBox(width: 4),
                            Text("같은 팀이면 좋겠어요", style: TextStyle(color: Colors.teal)),
                          ],
                        )
                      : SizedBox.shrink(),
                  Text("2/6 명 참여", style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: TextStyle(fontSize: 13)),
    );
  }
}
