import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:ballkkaye_frontend/data/model/user.dart';
import 'package:flutter/material.dart';

class MypageUserCard extends StatelessWidget {
  User user;

  MypageUserCard(this.user);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/user/detail");
      },
      child: Container(
        decoration: BoxDecoration(
            color: MColor.kBackground.normal,
            borderRadius: BorderRadius.circular(8),
            boxShadow: MColor.kShadow.normal),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      width: 30,
                      height: 30,
                      color: MColor.kFill.normal,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: (user.profileUrl != null && user.profileUrl!.isNotEmpty)
                              ? Image.network(
                                  user.profileUrl!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "/assets/images/user.png",
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MText.normal4_6('${user.nickname}', color: MColor.kLabel.normal),
                      MText.normal6_5('${user.teamName}', color: MColor.kLabel.alternative),
                    ],
                  ),
                ],
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
