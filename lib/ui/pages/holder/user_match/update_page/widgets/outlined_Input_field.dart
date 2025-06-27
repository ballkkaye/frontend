import 'package:flutter/material.dart';

class OutlinedInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType keyboardType;
  final int? maxLength;

  const OutlinedInputField({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.maxLength,
  });

  @override
  State<OutlinedInputField> createState() => _OutlinedInputFieldState();
}

class _OutlinedInputFieldState extends State<OutlinedInputField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _isFocused ? Colors.teal : Colors.grey.shade400;

    return TextField(
      focusNode: _focusNode,
      controller: widget.controller,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor, width: _isFocused ? 2 : 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.teal, width: 2),
        ),
      ),
    );
  }
}
