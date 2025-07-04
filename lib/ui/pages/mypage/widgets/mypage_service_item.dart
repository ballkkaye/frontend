import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback? onTap;

  const ServiceItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 48,
        child: Row(
          children: [
            icon,
            SizedBox(width: 10),
            Expanded(
              child: MText.normal5_500(label, color: MColor.kLabel.normal),
            ),
          ],
        ),
      ),
    );
  }
}
