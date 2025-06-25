import 'package:flutter/material.dart';

class UserMatchDetailBody extends StatelessWidget {
  const UserMatchDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목 + 시간
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '직관같이갑시다',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('15분전', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 16),

          // 태그들
          Wrap(
            spacing: 8,
            children: [
              _buildTag('여성'),
              _buildTag('20대 이상'),
              _buildTag('롯데 자이언츠'),
            ],
          ),

          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.check_circle, color: Colors.teal, size: 16),
              SizedBox(width: 4),
              Text('같은 팀이면 좋겠어요', style: TextStyle(color: Colors.teal)),
            ],
          ),

          SizedBox(height: 20),

          // 경기 정보 카드
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _buildMatchRow('경기 일정', '2025.06.19'),
                _buildMatchRow('경기', '롯데 vs 두산'),
                _buildMatchRow('경기장', '사직 야구장'),
              ],
            ),
          ),

          SizedBox(height: 20),
          Text(
            '같이 응원을 열심히 하는 사람들만\n아직 표를 구매하지 않았으니 같이 티켓팅 해봅시다!',
            style: TextStyle(fontSize: 14),
          ),

          Spacer(),

          // 참여 인원 + 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.favorite_border, color: Colors.red),

              Spacer(), // 아이콘과 텍스트/버튼 사이 간격을 밀어냄

              Row(
                mainAxisSize: MainAxisSize.min, // 내부 Row 크기만큼만 차지
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end, // 텍스트 오른쪽 정렬
                    children: [
                      Text('현재 2/6명 참여중', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text('ssar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(width: 8), // 텍스트와 버튼 사이 간격
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    child: Text('채팅하기', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

Widget _buildTag(String label) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(label, style: TextStyle(fontSize: 12)),
  );
}

Widget _buildMatchRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(
          value,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
