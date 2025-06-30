import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_icon.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class ChatRoomListExitDialog extends StatelessWidget {
  const ChatRoomListExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: MIcon.page.userMatch.dotHorizontal,
      onPressed: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: "chat_exit",
          barrierColor: Colors.black.withOpacity(0.5),
          pageBuilder: (context, animation, secondaryAnimation) {
            return Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 360,
                  height: 176,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: MColor.kBackground.normal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 360,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MText.modal1(
                              '채팅방 나가기',
                              color: MColor.kLabel.normal,
                            ),
                            const SizedBox(height: 8),
                            MText.modal3_4(
                              '채팅방에서 나가시겠습니까?',
                              color: MColor.kLabel.neutral,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          // 버튼 위 구분선
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: MColor.kLine.normal,
                          ),
                          SizedBox(
                            width: 360,
                            height: 55,
                            child: Row(
                              children: [
                                // 취소 버튼
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: MText.modal2_4('취소', color: MColor.kLabel.normal),
                                  ),
                                ),
                                // 버튼 사이 구분선
                                Container(
                                  width: 2,
                                  height: 55,
                                  color: MColor.kLine.normal.withOpacity(0.6),
                                ),
                                // 나가기 버튼
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      // TODO: 나가기 처리
                                    },
                                    child: MText.modal2_4('나가기', color: MColor.kLabel.normal),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
