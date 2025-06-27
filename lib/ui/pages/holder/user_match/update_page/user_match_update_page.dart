import 'package:ballkkaye_frontend/ui/pages/holder/user_match/update_page/widgets/outlined_Input_field.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/user_match/update_page/widgets/select_button.dart';
import 'package:flutter/material.dart';

import 'widgets/gender_toggle.dart';

class UserMatchUpdatePage extends StatelessWidget {
  const UserMatchUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동행 작성', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 1,
              height: 6,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  _buildLabel('채팅방 인원'),
                  const SizedBox(height: 4),
                  OutlinedInputField(
                    hintText: '인원 수',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  _buildLabel('희망 성별'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: GenderToggle()),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildLabel('희망 연령'),
                  const SizedBox(height: 4),
                  SelectButton(
                    hintText: '연령',
                    options: ['~20대', '20대 ~ 30대', '30대 ~ 40대', '40대 이상', '연령 무관'],
                  ),
                  const SizedBox(height: 16),
                  _buildLabel('희망 응원팀'),
                  const SizedBox(height: 4),
                  SelectButton(
                    hintText: '희망 응원팀',
                    options: ['LG 트윈스', '두산 베어스'],
                    onChanged: (value) {
                      print('선택한 팀: $value');
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildLabel('모집 글 작성'),
                  const SizedBox(height: 4),
                  OutlinedInputField(
                    hintText: '제목',
                  ),
                  const SizedBox(height: 8),
                  OutlinedInputField(
                    hintText: '글 내용',
                    maxLines: 6,
                    maxLength: 1000,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade200,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('완료'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }
}
