import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailActionBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DetailActionBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
