import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';

class UpdateLabeledField extends StatelessWidget {
  final String? label;
  final Widget child;
  final double bottomSpacing;

  const UpdateLabeledField({
    super.key,
    this.label,
    required this.child,
    this.bottomSpacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            MText.h3_6(label!, color: MColor.kLabel.normal),
            const SizedBox(height: 10),
          ],
          child,
        ],
      ),
    );
  }
}
