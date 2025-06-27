import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:flutter/material.dart';

class GameCenterCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget icon;
  final VoidCallback? onTap;

  const GameCenterCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          color: MColor.kBackground.normal,
          borderRadius: BorderRadius.circular(8),
          boxShadow: MColor.kShadow.normal,
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: MColor.kLabel.normal,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: MColor.kLabel.neutral,
                      ),
                    ),
                  ],
                ),
              ),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
