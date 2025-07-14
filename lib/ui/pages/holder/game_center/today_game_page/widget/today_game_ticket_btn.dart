import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/style/m_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TodayGameTicketBtn extends StatelessWidget {
  final String? ticketUrl;

  const TodayGameTicketBtn({
    super.key,
    required this.ticketUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (ticketUrl == null || ticketUrl!.isEmpty) {
      return const SizedBox.shrink(); //에러터지는거 방지로 아무것도 안 보여줌
    }

    return OutlinedButton(
      onPressed: () async {
        final url = Uri.parse(ticketUrl!);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      },
      style: OutlinedButton.styleFrom(
        shape: LinearBorder(),
        minimumSize: Size(double.infinity, 61),
        foregroundColor: MColor.kPrimary.normal,
        backgroundColor: MColor.kPrimary.strong,
        side: BorderSide.none,
      ),
      child: MText.button1(
        'Ticket',
        color: MColor.kLabel.white,
      ),
    );
  }
}
