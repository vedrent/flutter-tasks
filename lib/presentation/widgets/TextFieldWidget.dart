import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.onChanged,
    required this.hintText
  });

  final ValueChanged<String>? onChanged;
  final String hintText;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState(
      onChanged: onChanged,
      hintText: hintText
  );
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final ValueChanged<String>? onChanged;
  final String hintText;

  _TextFieldWidgetState({
    required this.onChanged,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return
      TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText
        ),
        maxLines: null,
      );
  }
}