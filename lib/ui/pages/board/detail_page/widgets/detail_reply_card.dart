import 'package:flutter/material.dart';

class DetailReplyCard extends StatelessWidget {
  final String author;
  final String content;
  final String team;
  final String time;
  final bool isReply;
  final String? parentAuthor; // ✅ 추가

  const DetailReplyCard({
    super.key,
    required this.author,
    required this.content,
    required this.team,
    required this.time,
    this.isReply = false,
    this.parentAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isReply ? 40 : 0), // ✅ 들여쓰기 조건 적용
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 이미지 + 작성자 + 시간
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/images/user.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          author,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(team, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8),

            // 본문
            Text.rich(
              TextSpan(
                children: [
                  if (parentAuthor != null)
                    TextSpan(
                      text: '@$parentAuthor ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  TextSpan(text: content),
                ],
              ),
            ),

            const SizedBox(height: 8),
            // 버튼
            Row(
              children: [
                const Icon(Icons.favorite_border, size: 18),
                const SizedBox(width: 10),
                const Text('답글', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const Spacer(),
                const Icon(Icons.more_vert, size: 18),
              ],
            )
          ],
        ),
      ),
    );
  }
}
