import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailReplyInputBar extends StatelessWidget {
  const DetailReplyInputBar({
    super.key,
    required TextEditingController replyController,
  }) : _replyController = replyController;

  final TextEditingController _replyController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _replyController,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "댓글을 입력하세요",
                fillColor: MColor.kLabel.disable,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.arrow_up),
            color: MColor.kLabel.neutral,
          ),
        ],
      ),
    );
  }
}
