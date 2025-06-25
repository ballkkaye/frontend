import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/ui/pages/auth/join_page/widget/join_next_btn.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  int selectedGenderIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColor.kBackground.normal,
      appBar: AppBar(
        backgroundColor: MColor.kBackground.normal,
        title: Text(''),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Form(
                  // TODO: 유효성검사, 통신 시 키값 추가
                  // key: ,
                  child: Column(
                    children: [
                      // 닉네임
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MText.h3_600(
                            '닉네임을 입력해주세요',
                            color: MColor.kLabel.normal,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            // controller: ,
                            decoration: InputDecoration(
                                hintText: '닉네임',
                                hintStyle: TextStyle(
                                  color: MColor.kLabel.alternative,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                filled: true,
                                fillColor: MColor.kBackground.normal,
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: MColor.kLine.normal,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: MColor.kLine.normal,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: MColor.kPrimary.strong,
                                    width: 1.5,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: MColor.kStatus.negative,
                                      width: 1.5,
                                    ))),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return '닉네임을 입력해주세요';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      // 성별
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MText.h3_600(
                            '성별을 선택해주세요',
                            color: MColor.kLabel.normal,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: MColor.kLine.normal),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: List.generate(2, (index) {
                                final List<String> options = ['남성', '여성'];
                                final bool isSelected = selectedGenderIndex == index;

                                return Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedGenderIndex = index;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                      decoration: BoxDecoration(
                                        color: isSelected ? MColor.kPrimary.strong : Colors.transparent,
                                        border: Border(
                                          right: index != options.length - 1
                                              ? BorderSide(color: MColor.kLine.normal)
                                              : BorderSide.none,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          options[index],
                                          style: TextStyle(
                                            color: isSelected ? Colors.white : MColor.kLabel.alternative,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      // 생년월일
                      // 연령대
                      // 응원팀
                      Spacer(),
                      JoinNextBtn(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
